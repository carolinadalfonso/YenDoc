import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/responses/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends UserEntity {
  UserModel({
    required String username,
    required String mail,
    required String fullName,
    required String avatar,
  }) : super(
          username: username,
          mail: mail,
          fullName: fullName,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
}
