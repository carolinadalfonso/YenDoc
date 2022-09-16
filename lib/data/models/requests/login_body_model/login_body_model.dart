import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/requests/login_body_entity.dart';

part 'login_body_model.g.dart';

@JsonSerializable(createFactory: false)
class LoginBodyModel extends LoginBodyEntity {
  LoginBodyModel({
    required String username,
    required String password,
  }) : super(
          username,
          password,
        );

  Map<String, dynamic> toJson() {
    return _$LoginBodyModelToJson(this);
  }
}
