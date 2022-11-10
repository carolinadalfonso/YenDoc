import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/framework/util/form_validator.dart';
import '../../../../core/framework/util/general_navigator.dart';
import '../../../../core/framework/util/util_preferences.dart';
import '../../../../data/models/requests/login_body_model/login_body_model.dart';
import '../../../../domain/entities/responses/user_entity.dart';
import '../../../cubit/login/login_cubit.dart';

import '../../home/home_screen.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController textUserController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FormValidator formValidator = FormValidator();

  login(UserEntity user) {
    saveUserData(user);
    GeneralNavigator.push(
      HomeScreen(datePick: DateTime.now()),
      transitionType: PageTransitionType.rightToLeft,
    );
  }

  saveUserData(UserEntity user) {
    UtilPreferences.prefs.setString(UtilPreferences.userFullName, user.fullName);
    UtilPreferences.prefs.setString(UtilPreferences.userAvatar, user.avatar.substring(user.avatar.lastIndexOf(',') + 1));
  }

  validateForm(BuildContext blocContext) {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      FocusScope.of(blocContext).unfocus();
      blocContext.read<LoginCubit>().login(LoginBodyModel(
            username: textUserController.text,
            password: textPasswordController.text,
          ));
    }
  }
}
