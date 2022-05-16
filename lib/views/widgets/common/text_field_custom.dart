import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final bool isPassword;
  final IconData? prefixIcon;
  final String? description;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  //final TextStyle? style;
  final String? initialValue;
  final bool enabled;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const TextFieldCustom({
    Key? key,
    required this.controller,
    this.hint,
    this.isPassword = false,
    this.prefixIcon,
    this.description,
    this.keyboardType,
    this.inputFormatters,
    this.autovalidateMode,
    //this.style,
    this.initialValue,
    this.enabled = true,
    this.onSaved,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late bool _isPassword;
  IconData _showPasswordIcon = Icons.visibility_off;

  @override
  initState() {
    _isPassword = widget.isPassword;
    super.initState();
  }

  _togglePassword() {
    setState(() {
      _isPassword = !_isPassword;
      _showPasswordIcon = _isPassword ? Icons.visibility_off : Icons.visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.description != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.description!,
                  style: TextStyle(
                    color: ThemeManager.kPrimaryColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: widget.controller,
          enabled: widget.enabled,
          autovalidateMode: AutovalidateMode.always,
          autocorrect: false,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          onSaved: widget.onSaved,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIconConstraints: BoxConstraints(minWidth: widget.prefixIcon != null ? 48 : 20),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: ThemeManager.kPrimaryColor,
                  )
                : const SizedBox.shrink(),
            suffixIcon: widget.isPassword
                ? IconButton(
                    color: ThemeManager.kPrimaryColor,
                    splashRadius: 20,
                    icon: Icon(_showPasswordIcon),
                    onPressed: () => _togglePassword(),
                  )
                : null,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeManager.kPrimaryColor50, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeManager.kPrimaryColor50, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusColor: ThemeManager.kPrimaryColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeManager.kPrimaryColor100, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          obscureText: _isPassword,
          inputFormatters: widget.inputFormatters,
        ),
      ],
    );
  }
}
