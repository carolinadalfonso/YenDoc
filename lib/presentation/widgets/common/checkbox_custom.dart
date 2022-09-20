import 'package:flutter/material.dart';
import '../../../core/framework/theme/theme_manager.dart';

class CheckboxCustom extends StatelessWidget {
  final String text;
  final bool checked;
  final ValueChanged<bool?> onChanged;
  final double? size;
  final bool? enabled;

  const CheckboxCustom({
    Key? key,
    required this.text,
    required this.checked,
    required this.onChanged,
    this.size,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-15, -6),
      child: GestureDetector(
        onTap: () => onChanged(!checked),
        child: Row(
          children: [
            Transform.scale(
              scale: size ?? 1,
              child: Checkbox(
                activeColor: ThemeManager.kPrimaryColor,
                value: checked,
                onChanged: enabled! ? (value) => onChanged(value) : null,
              ),
            ),
            Transform.translate(
              offset: const Offset(-8, 0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
