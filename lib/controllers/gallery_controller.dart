import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';
import 'package:yendoc/core/framework/util/util.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/views/screens/display_picture/display_picture.dart';

class GalleryController extends GetxController {
  late VisitEntity visit;
  List images = [];

  late CameraController cameraController;
  late int visitId;
  late Future<void> initializeControllerFuture;
  bool isCapturing = false;
  bool flashOn = false;

  init(VisitEntity visit, CameraDescription? camera) async {
    this.visit = visit;
    visitId = visit.id;

    if (camera != null) {
      cameraController = CameraController(
        camera,
        ResolutionPreset.high,
      );
      initializeControllerFuture = cameraController.initialize();
    }

    getVisitImages();
  }

  void getVisitImages() async {
    final Directory fullPath = await Util.getPhotosPath(visit.id);
    images.clear();
    if (await fullPath.exists()) {
      images = fullPath.listSync();
    }
    update();
  }

  void deleteImage(File image, BuildContext context) async {
    await image.delete();
    CoolSnackBar.of(context).success(Localization.xGallery.deletedPhoto);
    getVisitImages();
  }

  void changeFlash() {
    flashOn = !flashOn;
    update();
  }

  Future<void> takePicture(BuildContext context) async {
    if (!isCapturing) {
      isCapturing = true;
      update();
      try {
        await initializeControllerFuture;
        await cameraController.takePicture().then((image) async {
          final pathVisitId = await Util.getPhotosPath(visitId);
          if (!await pathVisitId.exists()) {
            await pathVisitId.create(recursive: true);
          }
          String fullPath = "${pathVisitId.path}/${image.name}";

          //Guardado y borrado del archivo automático
          await image.saveTo(fullPath);
          final imagenDefault = File(image.path);
          await imagenDefault.delete();

          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(
                imagePath: fullPath,
              ),
            ),
          );
        }).whenComplete(() {
          isCapturing = false;
          update();
        });
      } catch (e) {
        rethrow;
      }
    }
  }

  deletePictureDisplay(BuildContext context, String imagePath) async {
    try {
      final file = File(imagePath);
      await file.delete();
      CoolSnackBar.of(context).success(Localization.xGallery.deletedPhoto, margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 15));
      Get.back();
      Get.back();
    } catch (e) {
      CoolSnackBar.of(context).error(Localization.xGallery.deletedPhotoError, margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 15));
      rethrow;
    }
  }

  savePicture() {
    getVisitImages();
    Get.back();
    Get.back();
  }
}
