// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      avatar: json['avatar'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'token': instance.token,
    };
