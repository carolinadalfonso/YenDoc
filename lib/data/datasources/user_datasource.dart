import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:yendoc/data/datasources/base/datasource.dart';
import 'package:yendoc/data/models/requests/change_password_body_model/change_password_body_model.dart';
import 'package:yendoc/data/models/responses/user/user_model.dart';
import 'package:yendoc/domain/entities/responses/user_entity.dart';

import 'interfaces/iuser_datasource.dart';

class UserDatasource extends DataSource implements IUserDatasource {
  UserDatasource({
    required super.httpClient,
  });

  final String _url = GlobalConfiguration().getValue("api");
  final String _endpointChangePassword = GlobalConfiguration().getDeepValue("endpoints:user:changePassword");
  final String _endpointByUser = GlobalConfiguration().getDeepValue("endpoints:user:byUser");

  @override
  Future<void> changePassword(ChangePasswordBodyModel changePasswordBodyModel) async {
    await httpClient.post(
      url: "$_url/$_endpointChangePassword",
      body: json.encode(changePasswordBodyModel.toJson()),
      requireToken: true,
    );
  }

  @override
  Future<UserEntity> getUser(String id) async {
    String data = await httpClient.get(
      url: "$_url/$_endpointByUser/$id",
      requireToken: true,
    );

    return UserModel.fromJson(json.decode(data));
  }
}
