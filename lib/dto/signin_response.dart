import 'package:json_annotation/json_annotation.dart';

part 'signin_response.g.dart';

@JsonSerializable()
class SigninResponse{

  SigninResponse();

  String username = "";

  factory SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}