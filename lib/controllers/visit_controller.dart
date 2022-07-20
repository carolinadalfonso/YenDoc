import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/views/screens/signature/signature_screen.dart';
import 'package:yendoc/views/screens/take_picture/take_picture_screen.dart';

import '../core/framework/localization/localization.dart';
import '../views/widgets/common/simple_button.dart';

class VisitController extends GetxController {
  final TextEditingController textDiagnosticController = TextEditingController();
  late VisitEntity visit;
  late CameraDescription firstCamera;
  late bool possibleCovid;
  int selectedIndex = 0;

  Future<void> init(VisitEntity visit) async {
    this.visit = visit;
    possibleCovid = visit.posibleCovid;

    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  @override
  void onClose() {
    super.onClose();
    textDiagnosticController.dispose();
  }

  void goToCamera() {
    Get.to(
      () => TakePictureScreen(
        camera: firstCamera,
        visit: visit,
      ),
    );
  }

  void goToSign() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) async {
      final bool? result = await Get.to(() => SignatureScreen(
            visit: visit,
          ));
      if (result != null && result) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    });
  }

  void onItemTapped(int index, BuildContext context, bool readOnly) {
    selectedIndex = index;
    update();
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
                      onPressed: () => Get.back(),
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
    possibleCovid = value;
    update();
  }

  getFirstCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }
}
