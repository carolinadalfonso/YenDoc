import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yendoc/core/framework/util/form_validator.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';

import '../../home/home_screen.dart';

export 'package:get/get.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController textUserController = TextEditingController(text: "usuarioAAA");
  final TextEditingController textPasswordController = TextEditingController(text: "Prueba1234");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FormValidator formValidator = FormValidator();

  login() {
    GeneralNavigator.push(
      HomeScreen(datePick: DateTime.now()),
      transitionType: PageTransitionType.rightToLeft, //TODO: Jugar con la transición
    );
  }

  validateForm() {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      //TODO: Loguear, verificación contra back
      login();
    }
  }
}
