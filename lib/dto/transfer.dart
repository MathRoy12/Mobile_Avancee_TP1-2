import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable()
class AddTaskRequest {
  AddTaskRequest();

  String name = "";
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline = DateTime(0);

  factory AddTaskRequest.fromJson(Map<String, dynamic> json) =>
      _$AddTaskRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddTaskRequestToJson(this);
}

@JsonSerializable()
class HomeItemResponse{

  HomeItemResponse();

  int id = 0;
  String name = "";
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline = DateTime(0);

  factory HomeItemResponse.fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}

@JsonSerializable()
class HomeItemPhotoResponse{

  HomeItemPhotoResponse();

  int id = 0;
  String name = "";
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline = DateTime(0);
  int photoId = 0;

  factory HomeItemPhotoResponse.fromJson(Map<String, dynamic> json) => _$HomeItemPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemPhotoResponseToJson(this);
}

@JsonSerializable()
class ProgressEvent{

  ProgressEvent();

  int value = 0;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime timestamp = DateTime.now();

  factory ProgressEvent.fromJson(Map<String, dynamic> json) => _$ProgressEventFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressEventToJson(this);
}

@JsonSerializable()
class SigninResponse{

  SigninResponse();

  String username = "";

  factory SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}

class SigninRequest extends SignupRequest{

}

@JsonSerializable()
class SignupRequest{

  SignupRequest();

  String username = "";
  String password = "";

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable()
class TaskDetailResponse{

  TaskDetailResponse();

  int id = 0;
  String name = "";
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline = DateTime(0);
  List<ProgressEvent> events = [];

  factory TaskDetailResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailResponseToJson(this);
}

@JsonSerializable()
class TaskDetailPhotoResponse{

  TaskDetailPhotoResponse();

  int id = 0;
  String name = "";
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline = DateTime(0);
  List<ProgressEvent> events = [];
  int photoId = 0;

  factory TaskDetailPhotoResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailPhotoResponseToJson(this);
}

final _dateFormatter = DateFormat("yyy-MM-dd'T'HH:mm:ss");

DateTime _fromJson(String date) => _dateFormatter.parse(date);
String _toJson(DateTime date) => _dateFormatter.format(date);