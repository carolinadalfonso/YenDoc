import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeManager.kPrimaryColor,
        onPressed: () async {
          try {
            final file = File(imagePath);
            await file.delete();
            Navigator.of(context).pop();
          } catch (e) {
            rethrow;
          }
        },
        child: const Icon(FontAwesomeIcons.trashCan),
      ),
    );
  }
}
