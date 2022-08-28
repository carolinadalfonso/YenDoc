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

    textUserController.text = "";
    textPasswordController.text = "";
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

  String? validateUser(String? user) {
    return Util.isEmpty(user)
        ? Localization.xValidation.requiredField
        : user!.length < 8
            ? "Mayor a 8"
            : null;
  }

  String? validatePassword(String? password) {
    return Util.isEmpty(password)
        ? Localization.xValidation.requiredField
        : !Util.passwordRegExp.hasMatch(password!)
            ? Localization.xValidation.passwordRequisits
            : null;
  }
}
