import 'package:json_annotation/json_annotation.dart';

part 'add_task_request.g.dart';

@JsonSerializable()
class AddTaskRequest {
  AddTaskRequest();

  String name = "";
  DateTime deadline = DateTime(0);

  factory AddTaskRequest.fromJson(Map<String, dynamic> json) =>
      _$AddTaskRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddTaskRequestToJson(this);
}
