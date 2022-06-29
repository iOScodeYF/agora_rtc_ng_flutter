import 'package:agora_rtc_ng/agora_rtc_ng.dart';
import 'package:agora_rtc_ng_example/config/agora.config.dart' as config;
import 'package:agora_rtc_ng_example/examples/example_actions_widget.dart';
import 'package:agora_rtc_ng_example/examples/log_sink.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// RtmpStreaming Example
class RtmpStreaming extends StatefulWidget {
  /// Construct the [RtmpStreaming]
  const RtmpStreaming({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RtmpStreamingState();
}

class _RtmpStreamingState extends State<RtmpStreaming> {
  late final RtcEngine _engine;
  bool _isReadyPreview = false;
  String channelId = config.channelId;
  bool isJoined = false;
  bool switchCamera = true;
  late TextEditingController _channelIdController;
  late TextEditingController _rtmpUrlController;
  bool _isStreaming = false;
  int _remoteUid = 0;
  // late RtcVideoViewController _localVideoController;

  @override
  void initState() {
    super.initState();
    _channelIdController = TextEditingController(text: channelId);
    _rtmpUrlController = TextEditingController();
    _initEngine();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  void _dispose() {
    _engine.leaveChannel();
    _engine.release();
  }

  Future<void> _initEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(
      appId: config.appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    // _localVideoController = RtcVideoViewController(
    //   canvas: const VideoCanvas(uid: 0),
    //   channelId: _channelIdController!.text,
    // );
    // await _localVideoController.initialize(_engine);

    _engine.registerEventHandler(RtcEngineEventHandler(
      onWarning: (warn, msg) {
        logSink.log('[onWarning] warn: $warn, msg: $msg');
      },
      onError: (ErrorCodeType err, String msg) {
        logSink.log('[onError] err: $err, msg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        logSink.log(
            '[onJoinChannelSuccess] connection: ${connection.toJson()} elapsed: $elapsed');
        setState(() {
          isJoined = true;
        });
        _startTranscoding();
      },
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) {
        logSink.log(
            '[onUserJoined] connection: ${connection.toJson()} remoteUid: $rUid elapsed: $elapsed');
        setState(() {
          _remoteUid = rUid;
        });
      },
      onUserOffline:
          (RtcConnection connection, int rUid, UserOfflineReasonType reason) {
        logSink.log(
            '[onUserOffline] connection: ${connection.toJson()}  rUid: $rUid reason: $reason');
        setState(() {
          _remoteUid = 0;
        });
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        logSink.log(
            '[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}');
        setState(() {
          isJoined = false;
        });
      },
      onRtmpStreamingStateChanged: (String url, RtmpStreamPublishState state,
          RtmpStreamPublishErrorType errCode) {
        logSink.log(
            '[onRtmpStreamingStateChanged] url: $url state: $state, errCode: $errCode');
      },
      onRtmpStreamingEvent: (String url, RtmpStreamingEvent eventCode) {
        logSink.log('[onRtmpStreamingEvent] url: $url eventCode: $eventCode');
      },
    ));

    await _engine.enableVideo();
    await _engine
        .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    await _engine.startPreview();

    setState(() {
      _isReadyPreview = true;
    });
  }

  void _joinChannel() async {
    await _engine.joinChannel(
        token: config.token, channelId: channelId, info: '', uid: config.uid);
  }

  void _leaveChannel() async {
    await _engine.leaveChannel();
  }

  Future<void> _startTranscoding({bool isRemoteUser = false}) async {
    if (_isStreaming && !isRemoteUser) return;
    final streamUrl = _rtmpUrlController.text;
    if (_isStreaming && isRemoteUser) {
      await _engine.removePublishStreamUrl(streamUrl);
    }

    _isStreaming = true;

    final List<TranscodingUser> transcodingUsers = [
      const TranscodingUser(
        uid: 0,
        x: 0,
        y: 0,
        width: 360,
        height: 640,
        audioChannel: 0,
        alpha: 1.0,
      )
    ];

    int width = 360;
    int height = 640;

    if (isRemoteUser) {
      transcodingUsers.add(TranscodingUser(
        uid: _remoteUid,
        x: 360,
        y: 0,
        width: 360,
        height: 640,
        audioChannel: 0,
        alpha: 1.0,
      ));

      width = 720;
      height = 640;
    }

    final liveTranscoding = LiveTranscoding(
      transcodingUsers: transcodingUsers,
      width: width,
      height: height,
      videoBitrate: 400,
      videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
      videoGop: 30,
      videoFramerate: 15,
      lowLatency: false,
      audioSampleRate: AudioSampleRateType.audioSampleRate44100,
      audioBitrate: 48,
      audioChannels: 1,
      audioCodecProfile: AudioCodecProfileType.audioCodecProfileLcAac,
    );

    try {
      await _engine.startRtmpStreamWithTranscoding(
          url: streamUrl, transcoding: liveTranscoding);
    } catch (e) {
      logSink.log('startRtmpStreamWithTranscoding error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExampleActionsWidget(
      displayContentBuilder: (context, isLayoutHorizontal) {
        if (!_isReadyPreview) return Container();
        return Stack(
          children: [
            Container(
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: VideoCanvas(uid: 0),
                ),
              ),
            ),
            if (_remoteUid != 0)
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: _remoteUid != 0
                      ? AgoraVideoView(
                          controller: VideoViewController.remote(
                          rtcEngine: _engine,
                          canvas: VideoCanvas(uid: _remoteUid),
                          connection: RtcConnection(
                              channelId: _channelIdController.text),
                        ))
                      : Container(
                          color: Colors.grey[200],
                        ),
                ),
              ),
          ],
        );
      },
      actionsBuilder: (context, isLayoutHorizontal) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _channelIdController,
              decoration: const InputDecoration(hintText: 'Channel ID'),
            ),
            TextField(
              controller: _rtmpUrlController,
              decoration: const InputDecoration(hintText: 'Input rtmp url'),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: isJoined ? _leaveChannel : _joinChannel,
                    child: Text('${isJoined ? 'Leave' : 'Join'} channel'),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}