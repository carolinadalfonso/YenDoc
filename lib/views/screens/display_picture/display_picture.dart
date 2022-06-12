import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yendoc/core/framework/localization/localization.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(Localization.xVisit.camera)),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
