import 'package:flutter/material.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';

import '../../../../core/framework/util/form_validator.dart';

class ChangePasswordController extends ChangeNotifier {
  final TextEditingController textActualPasswordController = TextEditingController();
  final TextEditingController textNewPasswordController = TextEditingController();
  final TextEditingController textRepeatNewPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FormValidator formValidator = FormValidator();

  validateForm(BuildContext context) {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      try {
        //TODO: Cambiar contraseña
        CoolSnackBar.of(context).success(Localization.xPassword.changeOk);
        GeneralNavigator.pop();
      } catch (ex) {
        CoolSnackBar.of(context).error(Localization.xPassword.changeNotOk);
      }
    }
  }
}
