import 'package:flutter/material.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;

  const SimpleButton({
    Key? key,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.enabled = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.white30,
          padding: const EdgeInsets.all(5),
          backgroundColor: enabled || isLoading ? ThemeManager.kPrimaryColor : ThemeManager.kPrimaryColor50,
          primary: Colors.white,
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        onPressed: !isLoading && enabled ? onPressed : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? !isLoading
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(icon),
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
                : Text(text),
          ],
        ),
      ),
    );
  }
}
