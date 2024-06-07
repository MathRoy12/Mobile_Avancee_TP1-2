// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressEvent _$ProgressEventFromJson(Map<String, dynamic> json) =>
    ProgressEvent()
      ..value = (json['value'] as num).toInt()
      ..timestamp = DateTime.parse(json['timestamp'] as String);

Map<String, dynamic> _$ProgressEventToJson(ProgressEvent instance) =>
    <String, dynamic>{
      'value': instance.value,
      'timestamp': instance.timestamp.toIso8601String(),
    };
