import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/framework/localization/localization.dart';
import '../../../../core/framework/util/form_validator.dart';
import '../../../../core/framework/util/general_navigator.dart';
import '../../../../core/framework/util/util.dart';
import '../../../../data/models/requests/visit_body_model/visit_body_model.dart';
import '../../../../domain/entities/responses/visit_entity.dart';
import '../../../cubit/save_visit/save_visit_cubit.dart';
import '../../../cubit/visit/visit_cubit.dart';
import '../../gallery/controller/gallery_controller.dart';
import '../../signature/signature_screen.dart';
import '../../take_picture/take_picture_screen.dart';

class VisitController extends ChangeNotifier {
  final TextEditingController textDiagnosticController = TextEditingController();
  final GalleryController galleryController = GalleryController();
  final FormValidator formValidator = FormValidator();
  late String _fullPathSign;
  late int _visitId;
  late VisitEntity _visit;
  late CameraDescription _firstCamera;
  late bool _possibleCovid;
  bool _isFetching = false;
  bool _hasErrorOnSave = false;
  String errorTextOnSave = "";

  bool get hasErrorOnSave => _hasErrorOnSave;

  void setHasErrorOnSave(bool hasError) {
    _hasErrorOnSave = hasError;
  }

  CameraDescription get firstCamera => _firstCamera;

  void setFirstCamera(CameraDescription firstCamera) {
    _firstCamera = firstCamera;
    notifyListeners();
  }

  bool get isFetching => _isFetching;

  void setIsFetching(bool isFetching) {
    _isFetching = isFetching;
  }

  int get visitId => _visitId;

  void setVisitId(int visitId) {
    _visitId = visitId;
    notifyListeners();
  }

  VisitEntity get visit => _visit;

  void setVisit(VisitEntity visit) {
    _visit = visit;
    if (_visit.diagnostic != null) {
      textDiagnosticController.text = _visit.diagnostic!;
    }
    _possibleCovid = _visit.posibleCovid;
    notifyListeners();
    if (_visit.signature != null) {
      saveLocalSignature();
    }
  }

  bool get possibleCovid => _possibleCovid;

  void setPossibleCovid(bool possibleCovid) {
    _possibleCovid = possibleCovid;
    notifyListeners();
  }

  void cargarVisita(BuildContext blocContext) {
    blocContext.read<VisitCubit>().getVisit(_visitId);
  }

  void goToCamera() {
    galleryController.setVisit(_visit);
    galleryController.setCameraController(firstCamera);

    GeneralNavigator.push(
      TakePictureScreen(
        camera: firstCamera,
        controller: galleryController,
      ),
      transitionType: PageTransitionType.rightToLeft,
    );
  }

  void goToSign() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) async {
      final bool? result = await GeneralNavigator.push(
        SignatureScreen(
          visit: _visit,
        ),
        transitionType: PageTransitionType.rightToLeft,
      );
      if (result != null && result) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    });
  }

  void onCheckboxCovidTapped(bool value) {
    setPossibleCovid(value);
  }

  void getFirstCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    setFirstCamera(cameras.first);
  }

  Future<bool> validateVisitFinishOk() async {
    if (!validateDiagnostic()) {
      _hasErrorOnSave = true;
    }
    if (!await validateAtLeastOnePhoto()) {
      _hasErrorOnSave = true;
    }
    if (!_possibleCovid && !await validateSignature()) {
      _hasErrorOnSave = true;
    }
    if (_hasErrorOnSave) {
      errorTextOnSave = !_possibleCovid ? Localization.xValidation.visitRequisitsOk : Localization.xValidation.visitRequisitsOkPossibleCOVID;
    }
    return _hasErrorOnSave;
  }

  Future<bool> validateVisitFinishNotOk() async {
    if (!validateDiagnostic()) {
      _hasErrorOnSave = true;
    }
    if (!await validateAtLeastOnePhoto()) {
      _hasErrorOnSave = true;
    }
    if (_hasErrorOnSave) {
      errorTextOnSave = Localization.xValidation.visitRequisitsNotOk;
    }
    return _hasErrorOnSave;
  }

  Future<void> saveVisit(BuildContext blocContext, String stateCode) async {
//TODO: Guardar fotos sacadas
    blocContext.read<SaveVisitCubit>().saveVisit(VisitBodyModel(
          id: visit.id,
          posibleCovid: _possibleCovid,
          diagnostic: textDiagnosticController.text,
          stateCode: stateCode,
          signature: await validateSignature() ? await getSignature() : null,
        ));
  }

  bool validateDiagnostic() {
    return !formValidator.isEmpty(textDiagnosticController.text);
  }

  Future<bool> validateAtLeastOnePhoto() async {
    final Directory fullPath = await Util.getPhotosPath(visit.id);
    bool hasAPhoto = false;
    if (await fullPath.exists()) {
      var images = fullPath.listSync();
      hasAPhoto = images.isNotEmpty;
    }
    return hasAPhoto;
  }

  Future<bool> validateSignature() async {
    _fullPathSign = await Util.getAndCreateSignaturePath(visit.id);
    File file = File(_fullPathSign);
    return await file.exists();
  }

  Future<String> getSignature() async {
    File file = File(_fullPathSign);
    Uint8List bytes = file.readAsBytesSync();
    return base64.encode(bytes);
  }

  void cancelSaveVisit() {
    _hasErrorOnSave = false;
    notifyListeners();
    GeneralNavigator.pop();
  }

  void saveLocalSignature() async {
    bool saveSignature = true;
    Uint8List bytesSignature = base64.decode(_visit.signature!);
    _fullPathSign = await Util.getAndCreateSignaturePath(visit.id);
    File file = File(_fullPathSign);
    bool exist = await file.exists();
    if (exist) {
      Uint8List bytesLocal = file.readAsBytesSync();
      String local = String.fromCharCodes(bytesLocal);
      String endpoint = String.fromCharCodes(bytesSignature);
      saveSignature = !(local == endpoint);
    }
    if (saveSignature) {
      await file.writeAsBytes(bytesSignature);
    }
  }
}
