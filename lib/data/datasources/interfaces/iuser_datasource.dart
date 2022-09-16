import '../../../domain/entities/responses/user_entity.dart';
import '../../models/requests/change_password_body_model/change_password_body_model.dart';

abstract class IUserDatasource {
  Future<UserEntity> getUser(String id);
  Future<void> changePassword(ChangePasswordBodyModel changePasswordBodyModel);
}
