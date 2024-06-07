// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDetailResponse _$TaskDetailResponseFromJson(Map<String, dynamic> json) =>
    TaskDetailResponse()
      ..id = (json['id'] as num).toInt()
      ..name = json['name'] as String
      ..percentageDone = (json['percentageDone'] as num).toInt()
      ..percentageTimeSpent = (json['percentageTimeSpent'] as num).toDouble()
      ..deadline = DateTime.parse(json['deadline'] as String)
      ..events = (json['events'] as List<dynamic>)
          .map((e) => ProgressEvent.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TaskDetailResponseToJson(TaskDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'deadline': instance.deadline.toIso8601String(),
      'events': instance.events,
    };
