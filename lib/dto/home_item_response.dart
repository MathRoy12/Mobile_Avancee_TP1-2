
import 'package:json_annotation/json_annotation.dart';

part 'home_item_response.g.dart';

@JsonSerializable()
class HomeItemResponse{

  HomeItemResponse();

  int id = 0;
  String name = "";
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  DateTime deadline = DateTime(0);

  factory HomeItemResponse.fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}