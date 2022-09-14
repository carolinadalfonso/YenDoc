import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/responses/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    required String username,
    required String mail,
    required String fullName,
    required String avatar,
    required String token,
  }) : super(
          username,
          mail,
          fullName,
          avatar,
          token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
