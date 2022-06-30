import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/views/screens/home/home_screen.dart';

class ReportController extends GetxController {
  final TextEditingController textDatePickController = TextEditingController();

  DateTime datePick = DateTime.now();

  //validateDate() {
  // if (textDatePickController.text.isEmpty) {
  //   return "La fecha es obligatoria";
  // } else {}
  //}

  goToVisits() {
    Get.to(() => HomeScreen(datePick: datePick, readOnly: true));
  }
}
