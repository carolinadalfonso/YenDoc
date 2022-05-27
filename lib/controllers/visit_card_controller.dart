import 'package:get/get.dart';
import 'package:yendoc/views/screens/visit_screen.dart/visit_screen.dart';

class VisitCardController extends GetxController {
  visit() {
    Get.to(() => const VisitScreen());
  }
}
