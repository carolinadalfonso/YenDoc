import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../presentation/widgets/common/simple_button.dart';

class CoolDialog {
  final BuildContext _context;

  CoolDialog._(this._context);

  static CoolDialog of(BuildContext context) => CoolDialog._(context);

  show({
    required String textButton1,
    required String textButton2,
    required String question,
    required String title,
    required VoidCallback onPressed1,
    required VoidCallback onPressed2,
    EdgeInsets? margin,
    bool? loadingButton1,
  }) {
    final BackdropFilter coolDialog = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        actionsPadding: margin ?? const EdgeInsets.all(10),
        actions: [
          SimpleButton(
            onPressed: onPressed1,
            text: textButton1,
            width: 100,
            isSmall: true,
            isSecondary: true,
            isLoading: loadingButton1 ?? false,
          ),
          SimpleButton(
            onPressed: onPressed2,
            text: textButton2,
            width: 100,
            isSmall: true,
          ),
        ],
        alignment: Alignment.center,
        content: Text(question),
        title: Text(title),
      ),
    );

    showDialog(
      context: _context,
      builder: (BuildContext context) {
        return coolDialog;
      },
    );
  }
}
