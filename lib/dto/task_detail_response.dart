import 'package:json_annotation/json_annotation.dart';

import 'progress_event.dart';

part 'task_detail_response.g.dart';

@JsonSerializable()
class TaskDetailResponse{

  TaskDetailResponse();

  int id = 0;
  String name = "";
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  DateTime deadline = DateTime(0);
  List<ProgressEvent> events = [];

  factory TaskDetailResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailResponseToJson(this);
}