import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yendoc/presentation/cubit/change_password/change_password_cubit.dart';

import '../../../../core/framework/util/form_validator.dart';
import '../../../../data/models/requests/change_password_body_model/change_password_body_model.dart';

class ChangePasswordController extends ChangeNotifier {
  final TextEditingController textActualPasswordController = TextEditingController();
  final TextEditingController textNewPasswordController = TextEditingController();
  final TextEditingController textRepeatNewPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FormValidator formValidator = FormValidator();

  validateForm(BuildContext blocContext) {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      blocContext.read<ChangePasswordCubit>().changePassword(ChangePasswordBodyModel(
            password: textActualPasswordController.text,
            newPassword: textNewPasswordController.text,
          ));
    }
  }
}
