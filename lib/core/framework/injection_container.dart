import 'package:yendoc/controllers/about_controller.dart';
import 'package:yendoc/controllers/change_password_controller.dart';
import 'package:yendoc/controllers/gallery_controller.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/controllers/map_controller.dart';
import 'package:yendoc/controllers/report_controller.dart';
import 'package:yendoc/controllers/visit_card_controller.dart';
import 'package:yendoc/controllers/visit_controller.dart';

class InjectionContainer extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
    Get.lazyPut<VisitCardController>(() => VisitCardController(), fenix: true);
    Get.lazyPut<VisitController>(() => VisitController(), fenix: true);
    Get.lazyPut<GalleryController>(() => GalleryController(), fenix: true);
    Get.lazyPut<MapController>(() => MapController(), fenix: true);
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController(), fenix: true);
    Get.lazyPut<ReportController>(() => ReportController(), fenix: true);
  }
}
