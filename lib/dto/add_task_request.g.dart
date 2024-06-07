// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskRequest _$AddTaskRequestFromJson(Map<String, dynamic> json) =>
    AddTaskRequest()
      ..name = json['name'] as String
      ..deadline = DateTime.parse(json['deadline'] as String);

Map<String, dynamic> _$AddTaskRequestToJson(AddTaskRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deadline': instance.deadline.toIso8601String(),
    };
