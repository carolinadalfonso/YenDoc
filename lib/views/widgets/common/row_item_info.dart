import 'package:flutter/material.dart';

class RowItemInfo extends StatelessWidget {
  final String title;
  final String? value;

  const RowItemInfo({Key? key, required this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          value != null ? Text(value!) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
