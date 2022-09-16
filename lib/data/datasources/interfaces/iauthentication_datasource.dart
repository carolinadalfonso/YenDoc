import '../../../domain/entities/responses/user_entity.dart';
import '../../models/requests/login_body_model/login_body_model.dart';

abstract class IAuthenticationDatasource {
  Future<UserEntity> login(LoginBodyModel loginBodyModel);
}
