import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/framework/localization/localization.dart';
import '../../../../core/framework/util/cool_snack_bar.dart';
import '../../../../core/framework/util/general_navigator.dart';
import '../../../../core/framework/util/util.dart';
import '../../../../domain/entities/responses/visit_entity.dart';
import '../../display_picture/display_picture_screen.dart';

class GalleryController extends ChangeNotifier {
  late CameraController _cameraController;
  late VisitEntity _visit;
  List images = [];

  late Future<void> initializeControllerFuture;
  bool isCapturing = false;
  bool flashOn = false;

  CameraController get cameraController => _cameraController;

  void setCameraController(CameraDescription camera) {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
    );
    notifyListeners();
  }

  VisitEntity get visit => _visit;

  void setVisit(VisitEntity visit) {
    _visit = visit;
    notifyListeners();
  }

  void getVisitImages() async {
    final Directory fullPath = await Util.getPhotosPath(_visit.id);
    images.clear();
    if (await fullPath.exists()) {
      images = fullPath.listSync();
    }
    notifyListeners();
  }

  void deleteImage(File image, BuildContext context) async {
    //TODO: Borrar en servidor
    await image.delete();
    CoolSnackBar.of(context).success(Localization.xGallery.deletedPhoto);
    getVisitImages();
  }

  void changeFlash() {
    flashOn = !flashOn;
    notifyListeners();
  }

  Future<void> takePicture(BuildContext context) async {
    if (!isCapturing) {
      isCapturing = true;
      notifyListeners();
      try {
        await initializeControllerFuture;
        await cameraController.takePicture().then((image) async {
          final pathVisitId = await Util.getPhotosPath(visit.id);
          if (!await pathVisitId.exists()) {
            await pathVisitId.create(recursive: true);
          }
          String fullPath = "${pathVisitId.path}/${image.name}";

          //Guardado y borrado del archivo automático
          await image.saveTo(fullPath);
          final imagenDefault = File(image.path);
          await imagenDefault.delete();
          //TODO: Guardar en servidor y Borrar en local

          GeneralNavigator.push(
            DisplayPictureScreen(
              imagePath: fullPath,
              galleryController: this,
            ),
            transitionType: PageTransitionType.rightToLeft,
          );
        }).whenComplete(() {
          isCapturing = false;
          notifyListeners();
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
      GeneralNavigator.pop();
      GeneralNavigator.pop();
    } catch (e) {
      CoolSnackBar.of(context).error(Localization.xGallery.deletedPhotoError, margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 15));
      rethrow;
    }
  }

  savePicture() {
    getVisitImages();
    GeneralNavigator.pop();
    GeneralNavigator.pop();
  }
}
