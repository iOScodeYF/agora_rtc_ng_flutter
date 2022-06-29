import 'package:agora_rtc_ng/agora_rtc_ng.dart';
import 'package:agora_rtc_ng_example/config/agora.config.dart' as config;
import 'package:agora_rtc_ng_example/examples/example_actions_widget.dart';
import 'package:agora_rtc_ng_example/examples/log_sink.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// SendMultiCameraStream Example
class SendMultiCameraStream extends StatefulWidget {
  /// Construct the [JoinChannelVideo]
  const SendMultiCameraStream({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SendMultiCameraStream> {
  late final RtcEngineEx _engine;
  bool _isReadyPreview = false;
  late final VideoDeviceManager _videoDeviceManager;
  bool isJoined = false, switchCamera = true, switchRender = true;
  Set<int> remoteUid = {};
  late TextEditingController _controller;
  List<VideoDeviceInfo> _videoDeviceInfos = [];
  late VideoDeviceInfo _primaryCameraDevice;
  late VideoDeviceInfo _secondaryCameraDevice;
  bool _isStartPrimaryCameraDevice = false;
  bool _isStartSecondaryCameraDevice = false;
  // late RtcVideoViewController _localVideoController;
  // late RtcVideoViewController _remoteVideoController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: config.channelId);

    _initEngine();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    // await _localVideoController.dispose();
    await _engine.stopPrimaryCameraCapture();
    await _engine.stopSecondaryCameraCapture();
    await _engine.leaveChannel();
    await _engine.release();
  }

  void _initEngine() async {
    _engine = createAgoraRtcEngineEx();
    await _engine.initialize(RtcEngineContext(
      appId: config.appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

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
      },
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) {
        logSink.log(
            '[onUserJoined] connection: ${connection.toJson()} remoteUid: $rUid elapsed: $elapsed');
        setState(() {
          remoteUid.add(rUid);
        });
      },
      onUserOffline:
          (RtcConnection connection, int rUid, UserOfflineReasonType reason) {
        logSink.log(
            '[onUserOffline] connection: ${connection.toJson()}  rUid: $rUid reason: $reason');
        setState(() {
          remoteUid.removeWhere((element) => element == rUid);
        });
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        logSink.log(
            '[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}');
        setState(() {
          isJoined = false;
          remoteUid.clear();
        });
      },
      onVideoDeviceStateChanged: (String deviceId, MediaDeviceType deviceType,
          MediaDeviceStateType deviceState) async {
        logSink.log(
            '[onVideoDeviceStateChanged] deviceId: $deviceId deviceType: $deviceType, deviceState: $deviceState');
        _videoDeviceInfos = await _videoDeviceManager.enumerateVideoDevices();
        setState(() {});
      },
    ));

    _videoDeviceManager = _engine.getVideoDeviceManager();
    _videoDeviceInfos = await _videoDeviceManager.enumerateVideoDevices();
    // _primaryCameraDevice = _videoDeviceInfos[0];
    // _secondaryCameraDevice = _primaryCameraDevice;

    // _localVideoController = RtcVideoViewController(
    //   canvas: const VideoCanvas(uid: 0),
    //   channelId: _controller.text,
    // );
    // await _localVideoController.initialize(_engine);

    await _engine.enableVideo();
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    await _engine.startPrimaryCameraCapture(CameraCapturerConfiguration(
      deviceId: _videoDeviceInfos[0].deviceId,
      format: VideoFormat(
        width: 640,
        height: 320,
        fps: FrameRate.frameRateFps10.value(),
      ),
    ));

    // Future.delayed(Duration(seconds: 5), () {
    await _engine.startPreview();

    setState(() {
      _isReadyPreview = true;
    });
  }

  Future<void> _joinChannel() async {
    await _engine.joinChannelEx(
        token: '',
        connection: RtcConnection(channelId: _controller.text, localUid: 1000),
        options: ChannelMediaOptions(
            publishCameraTrack: true,
            clientRoleType: ClientRoleType.clientRoleBroadcaster,
            channelProfile: ChannelProfileType.channelProfileLiveBroadcasting));

    if (_isStartSecondaryCameraDevice) {
      await _engine.joinChannelEx(
          token: '',
          connection:
              RtcConnection(channelId: _controller.text, localUid: 1001),
          options: ChannelMediaOptions(
            publishCameraTrack: false,
            publishSecondaryCameraTrack: true,
            clientRoleType: ClientRoleType.clientRoleBroadcaster,
            channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
          ));
    }
  }

  void _leaveChannel() async {
    // if (_isStartPrimaryCameraDevice) {
    //   await _engine.stopPrimaryCameraCapture();
    //   _isStartPrimaryCameraDevice = false;
    // }
    // if (_isStartSecondaryCameraDevice) {
    //   await _engine.stopSecondaryCameraCapture();
    //   _isStartSecondaryCameraDevice = false;
    // }
    // _primaryCameraDevice = _videoDeviceInfos[0];
    // _secondaryCameraDevice = _primaryCameraDevice;
    await _engine.stopSecondaryCameraCapture();
    await _engine.stopPrimaryCameraCapture();
    await _engine.leaveChannel();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ExampleActionsWidget(
      displayContentBuilder: (context, isLayoutHorizontal) {
        if (!_isReadyPreview) return Container();
        final children = <Widget>[
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1,
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(
                    uid: 0,
                    sourceType: VideoSourceType.videoSourceCameraPrimary,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(
                    uid: 0,
                    sourceType: VideoSourceType.videoSourceCameraSecondary,
                  ),
                ),
              ),
            ),
          ),
        ];
        if (isLayoutHorizontal) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        );
      },
      actionsBuilder: (context, isLayoutHorizontal) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Channel ID'),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: isJoined ? _leaveChannel : _joinChannel,
                    child: Text('${isJoined ? 'Leave' : 'Join'} channel'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: isJoined
                  ? null
                  : _videoDeviceInfos.length >= 2
                      ? () {
                          _isStartSecondaryCameraDevice =
                              !_isStartSecondaryCameraDevice;

                          if (_isStartSecondaryCameraDevice) {
                            _engine.startSecondaryCameraCapture(
                                CameraCapturerConfiguration(
                              deviceId: _videoDeviceInfos[1].deviceId,
                              format: VideoFormat(
                                width: 640,
                                height: 320,
                                fps: FrameRate.frameRateFps10.value(),
                              ),
                            ));
                          } else {
                            _engine.stopSecondaryCameraCapture();
                          }

                          setState(() {});
                        }
                      : null,
              child: Text(
                  '${_isStartSecondaryCameraDevice ? 'Stop' : 'Start'} Secondary Camera Device'),
            ),
          ],
        );
      },
    );
  }
}