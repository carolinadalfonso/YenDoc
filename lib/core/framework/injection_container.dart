import 'package:yendoc/controllers/about_controller.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/controllers/visit_card_controller.dart';

class InjectionContainer extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<LoginController>(LoginController());
    Get.put<AboutController>(AboutController());
    Get.put<VisitCardController>(VisitCardController());
  }
}
