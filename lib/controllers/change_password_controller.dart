import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController textActualPasswordController = TextEditingController();
  final TextEditingController textNewPasswordController = TextEditingController();
  final TextEditingController textRepeatNewPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  init() {
    textActualPasswordController.text = "";
    textNewPasswordController.text = "";
    textRepeatNewPasswordController.text = "";
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

  String? validateField(String? value) {
    if (value != null && value != "" && value.length > 8) {
      return null;
    } else {
      return Localization.xCommon.requiredField;
    }
  }

  String? validateRepeatPassword(String? repeatPassword) {
    if (validateField(repeatPassword) == null) {
      if (repeatPassword != textNewPasswordController.text) {
        return Localization.xPassword.match;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
