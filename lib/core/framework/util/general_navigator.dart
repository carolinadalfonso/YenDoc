import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../main.dart';

class GeneralNavigator {
  static pushNamed(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  static push(Widget screen, {PageTransitionType transitionType = PageTransitionType.fade}) async {
    navigatorKey.currentState?.push(getRoute(screen, transitionType: transitionType));
  }

  static pushReplacement(Widget screen, {PageTransitionType transitionType = PageTransitionType.fade}) {
    navigatorKey.currentState?.pushReplacement(getRoute(screen, transitionType: transitionType));
  }

  static pop() {
    navigatorKey.currentState?.pop();
  }

  static pushAndRemoveUntil(Widget screen) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false,
    );
  }

  static PageTransition getRoute(Widget screen, {PageTransitionType transitionType = PageTransitionType.fade}) {
    return PageTransition(
      child: screen,
      type: transitionType,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );
  }
}
