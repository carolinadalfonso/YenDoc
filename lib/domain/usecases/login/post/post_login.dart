import '../../../../core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../repositories/iauthentication_repository.dart';

import '../../../../data/models/requests/login_body_model/login_body_model.dart';
import '../../../entities/responses/user_entity.dart';

class PostLogin implements IUseCase<UserEntity, LoginBodyModel> {
  final IAuthenticationRepository _repository;

  PostLogin(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginBodyModel loginBodyModel) async {
    return await _repository.login(loginBodyModel);
  }
}
