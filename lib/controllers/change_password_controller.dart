import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';

import '../core/framework/util/util.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController textActualPasswordController = TextEditingController();
  final TextEditingController textNewPasswordController = TextEditingController();
  final TextEditingController textRepeatNewPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    textActualPasswordController.text = "";
    textNewPasswordController.text = "";
    textRepeatNewPasswordController.text = "";
  }

  @override
  void onClose() {
    super.onClose();

    textActualPasswordController.dispose();
    textNewPasswordController.dispose();
    textRepeatNewPasswordController.dispose();
  }

  validateForm(BuildContext context) {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      try {
        //TODO: Cambiar contraseña
        CoolSnackBar.of(context).success(Localization.xPassword.changeOk);
        Get.back();
      } catch (ex) {
        CoolSnackBar.of(context).error(Localization.xPassword.changeNotOk);
      }
    }
  }

  String? validatePassword(String? password) {
    return Util.isEmpty(password)
        ? Localization.xValidation.requiredField
        : !Util.passwordRegExp.hasMatch(password!)
            ? Localization.xValidation.passwordRequisits
            : null;
  }

  String? validateRepeatPassword(String? repeatPassword) {
    final String? isValidPassword = validatePassword(repeatPassword);

    if (isValidPassword != null) return isValidPassword;
    if (repeatPassword != textNewPasswordController.text) {
      return Localization.xValidation.passwordDontMatch;
    } else {
      return null;
    }
  }
}
