import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
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

  void goToCamera() {
    Get.to(
      () => TakePictureScreen(
        camera: firstCamera,
        visitId: visit.id,
      ),
    );
  }

  void onItemTapped(int index, BuildContext context) {
    selectedIndex = index;
    update();

    switch (index) {
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
                    onPressed: () => {},
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
                    onPressed: () => {},
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

  void onCheckboxCovidTapped(bool value) {
    possibleCovid = value;
    update();
  }

  getFirstCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
  }
}
