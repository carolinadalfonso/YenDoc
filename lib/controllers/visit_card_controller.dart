import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/views/screens/visit_screen/visit_screen.dart';

class VisitCardController extends GetxController {
  goToVisit(VisitEntity visitEntity) {
    Get.to(() => VisitScreen(visit: visitEntity));
  }

  getStateColor(String visitCode) {
    switch (visitCode) {
      case "DONE":
        return Colors.green;
      case "NOT_DONE":
        return Colors.red[500];
      case "IN_PROGRESS":
        return Colors.blueAccent;
      case "PENDING":
        return Colors.grey[500];
    }
  }

  getStateIcon(String visitCode) {
    switch (visitCode) {
      case "DONE":
        return FontAwesomeIcons.circleCheck;
      case "NOT_DONE":
        return FontAwesomeIcons.circleXmark;
      case "IN_PROGRESS":
        return FontAwesomeIcons.circleRight;
      case "PENDING":
        return FontAwesomeIcons.clock;
    }
  }
}
