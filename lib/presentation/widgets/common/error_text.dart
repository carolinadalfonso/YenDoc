import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorText extends StatelessWidget {
  final String errorText;

  const ErrorText({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.red[50],
        border: Border.all(color: Colors.red[100]!.withAlpha(100)),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.circleInfo,
            color: Colors.redAccent[400],
            size: 14,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            errorText,
            style: TextStyle(
              color: Colors.redAccent[400],
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
