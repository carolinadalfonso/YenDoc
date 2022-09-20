import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/framework/util/general_navigator.dart';
import '../../home/home_screen.dart';

import '../../../../core/framework/util/form_validator.dart';

class ReportController {
  final TextEditingController textDatePickController = TextEditingController();
  final FormValidator formValidator = FormValidator();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime datePick = DateTime.now();

  validateForm() {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      datePick = DateFormat("dd/MM/yyyy").parse(textDatePickController.text);
      goToVisits();
    }
  }

  goToVisits() {
    GeneralNavigator.push(
      HomeScreen(datePick: datePick, readOnly: true),
      transitionType: PageTransitionType.rightToLeft,
    );
  }
}
