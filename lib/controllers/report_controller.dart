import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/views/screens/home/home_screen.dart';

class ReportController extends GetxController {
  final TextEditingController textDatePickController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime datePick = DateTime.now();

  validateDate(date) {
    if (date == null || date == "") {
      return Localization.xValidation.requiredField;
    } else {
      return null;
    }
  }

  validateForm() {
    FormState form = formKey.currentState!;
    form.save();
    if (form.validate()) {
      datePick = DateFormat("dd/MM/yyyy").parse(textDatePickController.text);
      goToVisits();
    }
  }

  goToVisits() {
    Get.to(() => HomeScreen(datePick: datePick, readOnly: true));
  }
}
