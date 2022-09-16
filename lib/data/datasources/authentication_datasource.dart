import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:yendoc/data/datasources/base/datasource.dart';
import 'package:yendoc/data/datasources/interfaces/iauthentication_datasource.dart';
import 'package:yendoc/data/models/responses/user/user_model.dart';
import 'package:yendoc/domain/entities/responses/user_entity.dart';
import 'package:yendoc/data/models/requests/login_body_model/login_body_model.dart';

class AuthenticationDatasource extends DataSource implements IAuthenticationDatasource {
  AuthenticationDatasource({
    required super.httpClient,
  });

  final String _url = GlobalConfiguration().getValue("api");
  final String _endpointLogin = GlobalConfiguration().getDeepValue("endpoints:auth:login");

  @override
  Future<UserEntity> login(LoginBodyModel loginBodyModel) async {
    String data = await httpClient.post(
      url: "$_url/$_endpointLogin",
      body: json.encode(loginBodyModel.toJson()),
    );

    return UserModel.fromJson(json.decode(data));
  }
}
