import 'package:yendoc/controllers/about_controller.dart';
import 'package:yendoc/controllers/change_password_controller.dart';
import 'package:yendoc/controllers/gallery_controller.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/controllers/map_controller.dart';
import 'package:yendoc/controllers/visit_card_controller.dart';
import 'package:yendoc/controllers/visit_controller.dart';

class InjectionContainer extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<LoginController>(LoginController());
    Get.put<AboutController>(AboutController());
    Get.put<VisitCardController>(VisitCardController());
    Get.put<VisitController>(VisitController());
    Get.put<GalleryController>(GalleryController());
    Get.put<MapController>(MapController());
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
