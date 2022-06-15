import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

import '../../../core/framework/util/cool_dialog.dart';
import '../../../core/framework/util/cool_snack_bar.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(Localization.xGallery.photo)),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Center(
          child: Image.file(File(imagePath)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.green[600],
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
                child: const Icon(FontAwesomeIcons.fileCircleCheck),
                heroTag: null,
              ),
              FloatingActionButton(
                backgroundColor: Colors.red[700],
                onPressed: () async {
                  CoolDialog.of(context).show(
                    textButton1: Localization.xCommon.yes,
                    textButton2: Localization.xCommon.no,
                    question: Localization.xGallery.questionDeletePhoto,
                    title: Localization.xGallery.deletePhoto,
                    onPressed1: () async {
                      try {
                        final file = File(imagePath);
                        await file.delete();
                        CoolSnackBar.of(context)
                            .success(Localization.xGallery.deletedPhoto, margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 15));
                        Get.back();
                        Get.back();
                      } catch (e) {
                        CoolSnackBar.of(context)
                            .error(Localization.xGallery.deletedPhotoError, margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 15));
                        rethrow;
                      }
                    },
                    onPressed2: () => Get.back(),
                  );
                },
                child: const Icon(FontAwesomeIcons.trashCan),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
