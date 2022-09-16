import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../../data/models/requests/change_password_body_model/change_password_body_model.dart';
import '../../../repositories/iuser_repository.dart';

class PostChangePassword implements IUseCase<void, ChangePasswordBodyModel> {
  final IUserRepository _repository;

  PostChangePassword(this._repository);

  @override
  Future<Either<Failure, void>> call(ChangePasswordBodyModel changePasswordBodyModel) async {
    return await _repository.changePassword(changePasswordBodyModel);
  }
}
