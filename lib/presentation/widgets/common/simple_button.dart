import 'package:flutter/material.dart';
import '../../../core/framework/theme/theme_manager.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isLoading;
  final bool enabled;
  final double? width;
  final bool isSmall;
  final bool isSecondary;
  final VoidCallback? onPressed;
  final MainAxisAlignment? mainAxisAlignmentBody;
  final Color? iconColor;

  const SimpleButton({
    Key? key,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.isSmall = false,
    this.isSecondary = false,
    required this.onPressed,
    this.mainAxisAlignmentBody,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: isSmall ? 36 : 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.white30,
          padding: const EdgeInsets.all(5),
          backgroundColor: enabled || isLoading
              ? isSecondary
                  ? Colors.white
                  : ThemeManager.kPrimaryColor
              : ThemeManager.kPrimaryColor50,
          textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: isSmall ? 14 : 16,
          ),
          shape: RoundedRectangleBorder(
            side: isSecondary
                ? BorderSide(color: ThemeManager.kPrimaryColor, width: 1, style: BorderStyle.solid)
                : const BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.none),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        onPressed: !isLoading && enabled ? onPressed : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignmentBody ?? MainAxisAlignment.center,
          children: [
            icon != null
                ? !isLoading
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          icon,
                          size: isSmall ? 22 : 24,
                          color: iconColor ?? ThemeManager.kPrimaryColor,
                        ),
                      )
                    : const SizedBox.shrink()
                : const SizedBox.shrink(),
            isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white38,
                        color: Colors.white54,
                      ),
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: isSecondary
                          ? enabled
                              ? ThemeManager.kPrimaryColor
                              : Colors.blueGrey[200]
                          : enabled
                              ? Colors.white
                              : Colors.blueGrey[200],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
