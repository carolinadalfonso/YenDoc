import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yendoc/core/framework/util/form_validator.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';
import 'package:yendoc/core/framework/util/util_preferences.dart';
import 'package:yendoc/data/models/requests/login_body_model/login_body_model.dart';
import 'package:yendoc/domain/entities/responses/user_entity.dart';
import 'package:yendoc/presentation/cubit/login/login_cubit.dart';

import '../../home/home_screen.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController textUserController = TextEditingController(text: "rrudiger");
  final TextEditingController textPasswordController = TextEditingController(text: "Password1");
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
    UtilPreferences.prefs
        .setString(UtilPreferences.userFullName, user.username); //TODO: Cambier username por fullname cuando esté modificado el resultado de user
    UtilPreferences.prefs.setString(UtilPreferences.userAvatar, user.avatar.substring(user.avatar.lastIndexOf(',') + 1));
  }

  validateForm(BuildContext blocContext) {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      blocContext.read<LoginCubit>().login(LoginBodyModel(
            username: textUserController.text,
            password: textPasswordController.text,
          ));
    }
  }
}
