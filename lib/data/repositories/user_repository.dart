import '../models/requests/change_password_body_model/change_password_body_model.dart';
import '../../domain/entities/responses/user_entity.dart';
import '../../core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions/exception.dart';
import '../../domain/repositories/iuser_repository.dart';
import '../datasources/user_datasource.dart';
import 'base/repository.dart';

class UserRepository extends Repository<UserDatasource> implements IUserRepository {
  UserRepository({
    required super.dataSource,
  });

  @override
  Future<Either<Failure, void>> changePassword(ChangePasswordBodyModel changePasswordBodyModel) async {
    try {
      await dataSource.changePassword(changePasswordBodyModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String id) async {
    try {
      UserEntity user = await dataSource.getUser(id);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }
}
