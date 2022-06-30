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
  final String? initialValue;
  final bool enabled;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final int? lines;
  final int? maxLenght;
  final TextStyle? style;
  final bool? isDate;

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
    this.initialValue,
    this.enabled = true,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.lines,
    this.maxLenght,
    this.style,
    this.isDate = false,
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
          style: widget.style,
          minLines: widget.keyboardType == TextInputType.multiline ? widget.lines ?? 3 : 1,
          maxLines: widget.keyboardType == TextInputType.multiline ? widget.lines ?? 3 : 1,
          maxLength: widget.maxLenght,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: widget.keyboardType == TextInputType.multiline ? const EdgeInsets.all(15) : const EdgeInsets.symmetric(horizontal: 15),
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
          obscureText: widget.keyboardType == TextInputType.multiline ? false : _isPassword,
          inputFormatters: widget.inputFormatters,
          onTap: (widget.isDate != null && widget.isDate!)
              ? () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                    locale: const Locale('es', 'ES'),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: ThemeManager.kPrimaryColor,
                          colorScheme: ColorScheme.light(primary: ThemeManager.kPrimaryColor),
                          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    widget.controller.text = "${date.day}/${date.month}/${date.year}";
                  }
                }
              : null,
        ),
      ],
    );
  }
}
