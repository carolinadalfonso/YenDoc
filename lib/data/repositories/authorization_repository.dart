import 'package:yendoc/domain/entities/responses/user_entity.dart';
import 'package:yendoc/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yendoc/domain/repositories/iauthorization_repository.dart';

import '../models/requests/login_model/login_model.dart';
import 'base/repository.dart';

class AuthorizationRepositoty extends Repository implements IAuthorizationRepository {
  AuthorizationRepositoty({required super.dataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginModel loginModel) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> changePassword(String password, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
