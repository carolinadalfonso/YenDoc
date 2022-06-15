import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoolSnackBar {
  final BuildContext _context;

  CoolSnackBar._(this._context);

  static CoolSnackBar of(BuildContext context) => CoolSnackBar._(context);

  success(text, {Duration? duration, EdgeInsets? margin}) {
    _show(
      text: text,
      icon: FontAwesomeIcons.circleCheck,
      backgroundColor: Colors.green[600],
      duration: duration,
      margin: margin,
    );
  }

  info(text, {Duration? duration, EdgeInsets? margin}) {
    _show(
      text: text,
      icon: FontAwesomeIcons.circleInfo,
      backgroundColor: Colors.blue[600],
      duration: duration,
      margin: margin,
    );
  }

  warning(text, {Duration? duration, EdgeInsets? margin}) {
    _show(
      text: text,
      icon: FontAwesomeIcons.triangleExclamation,
      backgroundColor: Colors.yellow[800],
      duration: duration,
      margin: margin,
    );
  }

  error(text, {Duration? duration, EdgeInsets? margin}) {
    _show(
      text: text,
      icon: Icons.cancel_rounded,
      backgroundColor: Colors.red[600],
      duration: duration,
      margin: margin,
    );
  }

  custom({required String text, Color? backgroundColor, IconData? icon, Duration? duration, EdgeInsets? margin}) {
    _show(
      text: text,
      backgroundColor: backgroundColor,
      icon: icon,
      duration: duration,
      margin: margin,
    );
  }

  _show({
    required String text,
    Color? backgroundColor,
    IconData? icon,
    Duration? duration,
    EdgeInsets? margin,
  }) {
    final snackBar = SnackBar(
      elevation: 3,
      backgroundColor: backgroundColor,
      margin: margin,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      duration: duration ?? const Duration(seconds: 3),
      content: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, color: Colors.white70),
            ),
          Flexible(child: Text(text)),
        ],
      ),
    );

    ScaffoldMessenger.of(_context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
