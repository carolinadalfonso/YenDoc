import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';
import '../../data/models/requests/change_password_body_model/change_password_body_model.dart';
import '../entities/responses/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserEntity>> getUser(String id);
  Future<Either<Failure, void>> changePassword(ChangePasswordBodyModel changePasswordBodyModel);
}
