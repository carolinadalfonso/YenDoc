import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';
import 'package:yendoc/domain/entities/responses/visit_entity.dart';
import 'package:yendoc/presentation/screens/visit_screen/visit_screen.dart';

class VisitCardController {
  goToVisit(VisitEntity visitEntity, DateTime datePick, bool? readOnly) {
    GeneralNavigator.push(
      VisitScreen(
        visit: visitEntity,
        datePick: datePick,
        readOnly: readOnly,
      ),
      transitionType: PageTransitionType.rightToLeft,
    );
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
