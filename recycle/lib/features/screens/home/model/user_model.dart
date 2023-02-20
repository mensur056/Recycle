import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? email;
  String? userName;
  int? number;
  String? password;
  UserModel({this.email, this.number, this.password, this.userName});
  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
