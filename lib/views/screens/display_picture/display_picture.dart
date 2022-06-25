import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/gallery_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';

import '../../../core/framework/util/cool_dialog.dart';

class DisplayPictureScreen extends GetView<GalleryController> {
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
                  controller.savePicture();
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
                      await controller.deletePictureDisplay(context, imagePath);
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
