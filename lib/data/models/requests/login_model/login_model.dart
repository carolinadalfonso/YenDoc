import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/requests/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginEntity {
  LoginModel({
    required String username,
    required String password,
  }) : super(
          username,
          password,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
