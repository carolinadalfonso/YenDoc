import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';

import '../entities/responses/user_entity.dart';

abstract class IAuthorizationRepository {
  Future<Either<Failure, UserEntity>> getUser(String id);
  Future<Either<Failure, UserEntity>> login(String username, String password);
}
