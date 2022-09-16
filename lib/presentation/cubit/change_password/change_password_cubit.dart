import 'package:dartz/dartz.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';
import '../../../data/models/requests/change_password_body_model/change_password_body_model.dart';
import '../../../domain/usecases/change_password/post/post_change_password.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends CubitBase<void, ChangePasswordState> {
  final PostChangePassword _postChangePassword;

  ChangePasswordCubit(this._postChangePassword) : super(ChangePasswordInitial());

  void changePassword(ChangePasswordBodyModel changePasswordBodyModel) async {
    emit(ChangePasswordLoading());
    final either = await _postChangePassword.call(changePasswordBodyModel);
    emit(getState(either));
  }

  @override
  ChangePasswordState getState(Either<Failure, void> either) {
    return either.fold(
      (failure) => ChangePasswordError(failure),
      (data) => ChangePasswordSuccess(),
    );
  }
}
