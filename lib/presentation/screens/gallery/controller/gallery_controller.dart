import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yendoc/data/models/requests/picture_bode_model/picture_body_model.dart';
import 'package:yendoc/data/models/responses/picture/picture_model.dart';
import 'package:yendoc/domain/entities/responses/picture_entity.dart';
import '../../../../core/framework/localization/localization.dart';
import '../../../../core/framework/util/cool_snack_bar.dart';
import '../../../../core/framework/util/general_navigator.dart';
import '../../../../core/framework/util/util.dart';
import '../../../../domain/entities/responses/visit_entity.dart';
import '../../../cubit/delete_picture/delete_picture_cubit.dart';
import '../../../cubit/save_picture/save_picture_cubit.dart';
import '../../display_picture/display_picture_screen.dart';

typedef PictureCallback = void Function(PictureEntity pictureEntity);
typedef RemovePictureCallback = void Function(int pictureId);

class GalleryController extends ChangeNotifier {
  late CameraController _cameraController;
  late VisitEntity _visit;

  late Future<void> initializeControllerFuture;
  bool isCapturing = false;
  bool flashOn = false;

  late List<PictureEntity> pictures;
  late final PictureCallback _addPicture;
  late final RemovePictureCallback _removePicture;

  void setPictureCallback(PictureCallback addPicture) {
    _addPicture = addPicture;
  }

  void setRemovePictureCallback(RemovePictureCallback removePicture) {
    _removePicture = removePicture;
  }

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

  void deleteImage(int id, BuildContext blocContext) {
    blocContext.read<DeletePictureCubit>().deletePicture(id);
  }

  void removeImage(int id) {
    _removePicture(id);
    notifyListeners();
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

  Future<void> deletePictureDisplay(BuildContext context, String imagePath) async {
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

  Future<void> savePicture(BuildContext blocContext, String imagePath) async {
    File compressedFile = await FlutterNativeImage.compressImage(
      imagePath,
      quality: 50,
    );
    final bytes = compressedFile.readAsBytesSync();
    blocContext.read<SavePictureCubit>().savePicture(PictureBodyModel(
          visitId: visit.id,
          picture: base64Encode(bytes),
        ));
  }

  Future<void> savePictureSuccess(String imagePath, int pictureId) async {
    final file = File(imagePath);
    File compressedFile = await FlutterNativeImage.compressImage(
      imagePath,
      quality: 50,
    );
    final bytes = compressedFile.readAsBytesSync();
    PictureModel picture = PictureModel(id: pictureId, picture: base64Encode(bytes));
    _addPicture(picture);
    await file.delete();
    notifyListeners();
    GeneralNavigator.pop();
    GeneralNavigator.pop();
  }
}
