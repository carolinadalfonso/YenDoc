import 'package:yendoc/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yendoc/core/framework/bloc/cubit/cubit_base.dart';
import 'package:yendoc/data/models/requests/login_body_model/login_body_model.dart';
import 'package:yendoc/domain/usecases/login/post/post_login.dart';

import '../../../domain/entities/responses/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends CubitBase<UserEntity, LoginState> {
  final PostLogin _postLogin;

  LoginCubit(this._postLogin) : super(LoginInitial());

  void login(LoginBodyModel loginBodyModel) async {
    emit(LoginLoading());
    final either = await _postLogin.call(loginBodyModel);
    emit(getState(either));
  }

  @override
  LoginState getState(Either<Failure, UserEntity> either) {
    return either.fold(
      (failure) => LoginError(failure),
      (data) => LoginSuccess(data),
    );
  }
}
