import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yendoc/core/framework/util/form_validator.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';
import 'package:yendoc/data/models/requests/login_body_model/login_body_model.dart';
import 'package:yendoc/presentation/cubit/login/login_cubit.dart';

import '../../home/home_screen.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController textUserController = TextEditingController(text: "rrudiger");
  final TextEditingController textPasswordController = TextEditingController(text: "Password1");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FormValidator formValidator = FormValidator();

  login() {
    GeneralNavigator.push(
      HomeScreen(datePick: DateTime.now()),
      transitionType: PageTransitionType.rightToLeft,
    );
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
