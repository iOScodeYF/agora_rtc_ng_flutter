import 'package:agora_rtc_ng/src/binding_forward_export.dart';
part 'call_api_impl_params_json.g.dart';

// ignore_for_file: public_member_api_docs, unused_local_variable

@JsonSerializable(explicitToJson: true)
class VideoDeviceManagerGetDeviceJson {
  const VideoDeviceManagerGetDeviceJson(this.deviceIdUTF8);

  @JsonKey(name: 'deviceIdUTF8')
  final String deviceIdUTF8;
  factory VideoDeviceManagerGetDeviceJson.fromJson(Map<String, dynamic> json) =>
      _$VideoDeviceManagerGetDeviceJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$VideoDeviceManagerGetDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VideoDeviceManagerGetCapabilityJson {
  const VideoDeviceManagerGetCapabilityJson(this.capability);

  @JsonKey(name: 'capability')
  final VideoFormat capability;
  factory VideoDeviceManagerGetCapabilityJson.fromJson(
          Map<String, dynamic> json) =>
      _$VideoDeviceManagerGetCapabilityJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$VideoDeviceManagerGetCapabilityJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineSetSubscribeAudioBlacklistJson {
  const RtcEngineSetSubscribeAudioBlacklistJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineSetSubscribeAudioBlacklistJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineSetSubscribeAudioBlacklistJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineSetSubscribeAudioBlacklistJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineSetSubscribeAudioWhitelistJson {
  const RtcEngineSetSubscribeAudioWhitelistJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineSetSubscribeAudioWhitelistJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineSetSubscribeAudioWhitelistJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineSetSubscribeAudioWhitelistJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineSetSubscribeVideoBlacklistJson {
  const RtcEngineSetSubscribeVideoBlacklistJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineSetSubscribeVideoBlacklistJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineSetSubscribeVideoBlacklistJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineSetSubscribeVideoBlacklistJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineSetSubscribeVideoWhitelistJson {
  const RtcEngineSetSubscribeVideoWhitelistJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineSetSubscribeVideoWhitelistJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineSetSubscribeVideoWhitelistJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineSetSubscribeVideoWhitelistJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineGetExtensionPropertyJson {
  const RtcEngineGetExtensionPropertyJson(this.value);

  @JsonKey(name: 'value')
  final String value;
  factory RtcEngineGetExtensionPropertyJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetExtensionPropertyJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineGetExtensionPropertyJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineGetAudioDeviceInfoJson {
  const RtcEngineGetAudioDeviceInfoJson(this.deviceInfo);

  @JsonKey(name: 'deviceInfo')
  final DeviceInfo deviceInfo;
  factory RtcEngineGetAudioDeviceInfoJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineGetAudioDeviceInfoJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineGetAudioDeviceInfoJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineGetCallIdJson {
  const RtcEngineGetCallIdJson(this.callId);

  @JsonKey(name: 'callId')
  final String callId;
  factory RtcEngineGetCallIdJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineGetCallIdJsonFromJson(json);
  Map<String, dynamic> toJson() => _$RtcEngineGetCallIdJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineGetUserInfoByUserAccountJson {
  const RtcEngineGetUserInfoByUserAccountJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;
  factory RtcEngineGetUserInfoByUserAccountJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetUserInfoByUserAccountJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineGetUserInfoByUserAccountJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineGetUserInfoByUidJson {
  const RtcEngineGetUserInfoByUidJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;
  factory RtcEngineGetUserInfoByUidJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineGetUserInfoByUidJsonFromJson(json);
  Map<String, dynamic> toJson() => _$RtcEngineGetUserInfoByUidJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineSetAdvancedAudioOptionsJson {
  const RtcEngineSetAdvancedAudioOptionsJson(this.options);

  @JsonKey(name: 'options')
  final AdvancedAudioOptions options;
  factory RtcEngineSetAdvancedAudioOptionsJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineSetAdvancedAudioOptionsJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineSetAdvancedAudioOptionsJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineCreateDataStreamJson {
  const RtcEngineCreateDataStreamJson(this.streamId);

  @JsonKey(name: 'streamId')
  final int streamId;
  factory RtcEngineCreateDataStreamJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineCreateDataStreamJsonFromJson(json);
  Map<String, dynamic> toJson() => _$RtcEngineCreateDataStreamJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetDurationJson {
  const MediaPlayerGetDurationJson(this.duration);

  @JsonKey(name: 'duration')
  final int duration;
  factory MediaPlayerGetDurationJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetDurationJsonFromJson(json);
  Map<String, dynamic> toJson() => _$MediaPlayerGetDurationJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetPlayPositionJson {
  const MediaPlayerGetPlayPositionJson(this.pos);

  @JsonKey(name: 'pos')
  final int pos;
  factory MediaPlayerGetPlayPositionJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetPlayPositionJsonFromJson(json);
  Map<String, dynamic> toJson() => _$MediaPlayerGetPlayPositionJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetStreamCountJson {
  const MediaPlayerGetStreamCountJson(this.count);

  @JsonKey(name: 'count')
  final int count;
  factory MediaPlayerGetStreamCountJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetStreamCountJsonFromJson(json);
  Map<String, dynamic> toJson() => _$MediaPlayerGetStreamCountJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetStreamInfoJson {
  const MediaPlayerGetStreamInfoJson(this.info);

  @JsonKey(name: 'info')
  final PlayerStreamInfo info;
  factory MediaPlayerGetStreamInfoJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetStreamInfoJsonFromJson(json);
  Map<String, dynamic> toJson() => _$MediaPlayerGetStreamInfoJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetMuteJson {
  const MediaPlayerGetMuteJson(this.muted);

  @JsonKey(name: 'muted')
  final bool muted;
  factory MediaPlayerGetMuteJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetMuteJsonFromJson(json);
  Map<String, dynamic> toJson() => _$MediaPlayerGetMuteJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetPlayoutVolumeJson {
  const MediaPlayerGetPlayoutVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;
  factory MediaPlayerGetPlayoutVolumeJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetPlayoutVolumeJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MediaPlayerGetPlayoutVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerGetPublishSignalVolumeJson {
  const MediaPlayerGetPublishSignalVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;
  factory MediaPlayerGetPublishSignalVolumeJson.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPlayerGetPublishSignalVolumeJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MediaPlayerGetPublishSignalVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MediaPlayerCacheManagerGetCacheDirJson {
  const MediaPlayerCacheManagerGetCacheDirJson(this.path);

  @JsonKey(name: 'path')
  final String path;
  factory MediaPlayerCacheManagerGetCacheDirJson.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPlayerCacheManagerGetCacheDirJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MediaPlayerCacheManagerGetCacheDirJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseSpatialAudioEngineUpdateSelfPositionJson {
  const BaseSpatialAudioEngineUpdateSelfPositionJson(this.position);

  @JsonKey(name: 'position')
  final List<double> position;
  factory BaseSpatialAudioEngineUpdateSelfPositionJson.fromJson(
          Map<String, dynamic> json) =>
      _$BaseSpatialAudioEngineUpdateSelfPositionJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BaseSpatialAudioEngineUpdateSelfPositionJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseSpatialAudioEngineUpdateSelfPositionExJson {
  const BaseSpatialAudioEngineUpdateSelfPositionExJson(this.position);

  @JsonKey(name: 'position')
  final List<double> position;
  factory BaseSpatialAudioEngineUpdateSelfPositionExJson.fromJson(
          Map<String, dynamic> json) =>
      _$BaseSpatialAudioEngineUpdateSelfPositionExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BaseSpatialAudioEngineUpdateSelfPositionExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExSetSubscribeAudioBlacklistExJson {
  const RtcEngineExSetSubscribeAudioBlacklistExJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineExSetSubscribeAudioBlacklistExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExSetSubscribeAudioBlacklistExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExSetSubscribeAudioBlacklistExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExSetSubscribeAudioWhitelistExJson {
  const RtcEngineExSetSubscribeAudioWhitelistExJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineExSetSubscribeAudioWhitelistExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExSetSubscribeAudioWhitelistExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExSetSubscribeAudioWhitelistExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExSetSubscribeVideoBlacklistExJson {
  const RtcEngineExSetSubscribeVideoBlacklistExJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineExSetSubscribeVideoBlacklistExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExSetSubscribeVideoBlacklistExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExSetSubscribeVideoBlacklistExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExSetSubscribeVideoWhitelistExJson {
  const RtcEngineExSetSubscribeVideoWhitelistExJson(this.uidList);

  @JsonKey(name: 'uidList')
  final List<int> uidList;
  factory RtcEngineExSetSubscribeVideoWhitelistExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExSetSubscribeVideoWhitelistExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExSetSubscribeVideoWhitelistExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExGetUserInfoByUserAccountExJson {
  const RtcEngineExGetUserInfoByUserAccountExJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;
  factory RtcEngineExGetUserInfoByUserAccountExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExGetUserInfoByUserAccountExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExGetUserInfoByUserAccountExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExGetUserInfoByUidExJson {
  const RtcEngineExGetUserInfoByUidExJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;
  factory RtcEngineExGetUserInfoByUidExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExGetUserInfoByUidExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExGetUserInfoByUidExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RtcEngineExCreateDataStreamExJson {
  const RtcEngineExCreateDataStreamExJson(this.streamId);

  @JsonKey(name: 'streamId')
  final int streamId;
  factory RtcEngineExCreateDataStreamExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExCreateDataStreamExJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RtcEngineExCreateDataStreamExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioDeviceManagerGetPlaybackDeviceJson {
  const AudioDeviceManagerGetPlaybackDeviceJson(this.deviceId);

  @JsonKey(name: 'deviceId')
  final String deviceId;
  factory AudioDeviceManagerGetPlaybackDeviceJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetPlaybackDeviceJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetPlaybackDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioDeviceManagerGetPlaybackDeviceVolumeJson {
  const AudioDeviceManagerGetPlaybackDeviceVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;
  factory AudioDeviceManagerGetPlaybackDeviceVolumeJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetPlaybackDeviceVolumeJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetPlaybackDeviceVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioDeviceManagerGetRecordingDeviceJson {
  const AudioDeviceManagerGetRecordingDeviceJson(this.deviceId);

  @JsonKey(name: 'deviceId')
  final String deviceId;
  factory AudioDeviceManagerGetRecordingDeviceJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetRecordingDeviceJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetRecordingDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioDeviceManagerGetRecordingDeviceVolumeJson {
  const AudioDeviceManagerGetRecordingDeviceVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;
  factory AudioDeviceManagerGetRecordingDeviceVolumeJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetRecordingDeviceVolumeJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetRecordingDeviceVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioDeviceManagerGetPlaybackDeviceMuteJson {
  const AudioDeviceManagerGetPlaybackDeviceMuteJson(this.mute);

  @JsonKey(name: 'mute')
  final bool mute;
  factory AudioDeviceManagerGetPlaybackDeviceMuteJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetPlaybackDeviceMuteJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetPlaybackDeviceMuteJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioDeviceManagerGetRecordingDeviceMuteJson {
  const AudioDeviceManagerGetRecordingDeviceMuteJson(this.mute);

  @JsonKey(name: 'mute')
  final bool mute;
  factory AudioDeviceManagerGetRecordingDeviceMuteJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetRecordingDeviceMuteJsonFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetRecordingDeviceMuteJsonToJson(this);
}
