import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/views/screens/home/home_screen.dart';

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

  String? validateField(String? value) {
    if (value != null && value != "" && value.length > 8) {
      return null;
    } else {
      return Localization.xCommon.requiredField;
    }
  }
}
