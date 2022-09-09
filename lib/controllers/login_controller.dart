import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/views/screens/home/home_screen.dart';

import '../core/framework/util/util.dart';

export 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController textUserController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    textUserController.text = "usuarioAAA";
    textPasswordController.text = "Prueba1234";
  }

  @override
  void onClose() {
    super.onClose();

    textUserController.dispose();
    textPasswordController.dispose();
  }

  login() {
    Get.to(() => HomeScreen(datePick: DateTime.now()));
  }

  validateForm() {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      //TODO: Loguear, verificación contra back
      login();
    }
  }

  String? validateUser() {
    return Util.isEmpty(textUserController.text)
        ? Localization.xValidation.requiredField
        : textUserController.text.length < 8
            ? Localization.xValidation.userLenght
            : null;
  }

  String? validatePassword() {
    return Util.isEmpty(textPasswordController.text)
        ? Localization.xValidation.requiredField
        : !Util.passwordRegExp.hasMatch(textPasswordController.text)
            ? Localization.xValidation.passwordRequisits
            : null;
  }
}
