import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';
import 'package:yendoc/domain/entities/responses/visit_entity.dart';
import 'package:yendoc/presentation/screens/gallery/controller/gallery_controller.dart';
import 'package:yendoc/presentation/screens/signature/signature_screen.dart';
import 'package:yendoc/presentation/screens/take_picture/take_picture_screen.dart';

import '../../../../core/framework/localization/localization.dart';
import '../../../widgets/common/simple_button.dart';

class VisitController extends ChangeNotifier {
  final TextEditingController textDiagnosticController = TextEditingController();
  final GalleryController galleryController = GalleryController();
  late VisitEntity _visit;
  late CameraDescription _firstCamera;
  late bool _possibleCovid;
  int selectedIndex = 0;

  CameraDescription get firstCamera => _firstCamera;

  void setFirstCamera(CameraDescription firstCamera) {
    _firstCamera = firstCamera;
    notifyListeners();
  }

  VisitEntity get visit => _visit;

  void setVisit(VisitEntity visit) {
    _visit = visit;
    notifyListeners();
  }

  bool get possibleCovid => _possibleCovid;

  void setPossibleCovid(bool possibleCovid) {
    _possibleCovid = possibleCovid;
    notifyListeners();
  }

  void goToCamera() {
    galleryController.setVisit(_visit);
    galleryController.setCameraController(firstCamera);

    GeneralNavigator.push(
      TakePictureScreen(
        camera: firstCamera,
        controller: galleryController,
      ),
    );
  }

  void goToSign() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) async {
      final bool? result = await GeneralNavigator.push(
        SignatureScreen(
          visit: _visit,
        ),
      );
      if (result != null && result) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    });
  }

  void onItemTapped(int index, BuildContext context, bool readOnly) {
    selectedIndex = index;
    notifyListeners();
    if (!readOnly) {
      switch (index) {
        case 0:
          goToSign();
          break;
        case 1:
          goToCamera();
          break;
        case 2:
          final BackdropFilter coolDialog = BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              actionsPadding: const EdgeInsets.all(10),
              actions: [
                Column(
                  children: [
                    SimpleButton(
                      onPressed: () => {}, //TODO: Cambio de estado y cooldialog de que se hizo correctamente
                      text: Localization.xFinish.ok,
                      isSmall: true,
                      isSecondary: true,
                      icon: FontAwesomeIcons.circleCheck,
                      mainAxisAlignmentBody: MainAxisAlignment.start,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SimpleButton(
                      onPressed: () => {}, //TODO: Cambio de estado y cooldialog de que se hizo correctamente
                      text: Localization.xFinish.notOk,
                      isSmall: true,
                      isSecondary: true,
                      icon: FontAwesomeIcons.circleXmark,
                      mainAxisAlignmentBody: MainAxisAlignment.start,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SimpleButton(
                      onPressed: () => GeneralNavigator.pop(),
                      text: Localization.xCommon.cancel,
                      isSmall: true,
                    ),
                  ],
                ),
              ],
              alignment: Alignment.center,
              content: Text(Localization.xFinish.question),
              title: Text(Localization.xFinish.visit),
            ),
          );

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return coolDialog;
            },
          );
          break;
        default:
      }
    }
  }

  void onCheckboxCovidTapped(bool value) {
    setPossibleCovid(value);
  }

  void getFirstCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    setFirstCamera(cameras.first);
  }
}
