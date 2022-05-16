import 'package:flutter/material.dart';

class ThemeManager {
  /// Primary Color
  static Color kPrimaryColor = const Color.fromRGBO(31, 82, 235, 1);

  /// Primary Color With Alpha 100
  static Color kPrimaryColor100 = kPrimaryColor.withAlpha(100);

  /// Primary Color With Alpha 50
  static Color kPrimaryColor50 = kPrimaryColor.withAlpha(50);

  static Color kTextH1Color = const Color.fromRGBO(13, 12, 101, 1);
  static Color kTextH2Color = const Color.fromRGBO(8, 13, 37, 1);
  static Color kTextH2LightColor = kTextH2Color.withOpacity(0.4);

  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        bodyText2: TextStyle(color: kTextH2Color),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: kPrimaryColor,
        circularTrackColor: kPrimaryColor100,
      ),
      splashColor: kPrimaryColor100,
      highlightColor: Colors.white38,
      unselectedWidgetColor: kPrimaryColor100,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.elliptical(5, 5),
          ),
          color: kPrimaryColor,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        labelPadding: const EdgeInsets.all(10),
        unselectedLabelColor: kPrimaryColor100,
        indicator: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
          color: kPrimaryColor100,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      dialogTheme: const DialogTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(fontFamily: 'Poppins'),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: kPrimaryColor,
        selectionColor: kPrimaryColor100,
        selectionHandleColor: kPrimaryColor,
      ),
    );
  }
}
