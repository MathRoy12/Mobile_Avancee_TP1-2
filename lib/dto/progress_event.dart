import 'package:json_annotation/json_annotation.dart';

part 'progress_event.g.dart';

@JsonSerializable()
class ProgressEvent{

  ProgressEvent();

  int value = 0;
  DateTime timestamp = DateTime.now();

  factory ProgressEvent.fromJson(Map<String, dynamic> json) => _$ProgressEventFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressEventToJson(this);
}