import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/requests/change_password_body_entity.dart';

part 'change_password_body_model.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordBodyModel extends ChangePasswordBodyEntity {
  ChangePasswordBodyModel({
    required String password,
    required String newPassword,
  }) : super(
          password,
          newPassword,
        );

  Map<String, dynamic> toJson() {
    return _$ChangePasswordBodyModelToJson(this);
  }
}
