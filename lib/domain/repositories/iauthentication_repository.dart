import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';
import '../../data/models/requests/login_body_model/login_body_model.dart';
import '../entities/responses/user_entity.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, UserEntity>> login(LoginBodyModel loginBodyModel);
}
