import 'package:yendoc/core/errors/exceptions/exception.dart';
import 'package:yendoc/data/datasources/authentication_datasource.dart';
import 'package:yendoc/domain/entities/responses/user_entity.dart';
import 'package:yendoc/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yendoc/domain/repositories/iauthentication_repository.dart';

import '../models/requests/login_body_model/login_body_model.dart';
import 'base/repository.dart';

class AuthenticationRepository extends Repository<AuthenticationDatasource> implements IAuthenticationRepository {
  AuthenticationRepository({
    required super.dataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login(LoginBodyModel loginBodyModel) async {
    try {
      UserEntity user = await dataSource.login(loginBodyModel);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }
}
