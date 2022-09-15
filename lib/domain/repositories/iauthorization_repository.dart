import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';

import '../../data/models/requests/login_model/login_model.dart';
import '../entities/responses/user_entity.dart';

abstract class IAuthorizationRepository {
  Future<Either<Failure, UserEntity>> getUser(String id);
  Future<Either<Failure, UserEntity>> login(LoginModel loginModel);
  Future<Either<Failure, UserEntity>> changePassword(String password, String newPassword);
}
