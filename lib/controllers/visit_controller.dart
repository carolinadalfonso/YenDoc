import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/views/screens/take_picture/take_picture_screen.dart';

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

  void onItemTapped(int index) {
    selectedIndex = index;
    update();

    switch (index) {
      case 1:
        goToCamera();
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
