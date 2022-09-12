import 'package:yendoc/presentation/screens/change_password/controller/change_password_controller.dart';
import 'package:yendoc/presentation/screens/gallery/controller/gallery_controller.dart';
import 'package:yendoc/presentation/screens/login/controller/login_controller.dart';
import 'package:yendoc/presentation/screens/map/controller/map_controller.dart';
import 'package:yendoc/presentation/screens/report/controller/report_controller.dart';
import 'package:yendoc/presentation/screens/signature/controller/signature_controller.dart';
import 'package:yendoc/presentation/widgets/common/visit_card/controller/visit_card_controller.dart';
import 'package:yendoc/presentation/screens/visit_screen/controller/visit_controller.dart';

class InjectionContainer extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<VisitCardController>(() => VisitCardController(), fenix: true);
    Get.lazyPut<VisitController>(() => VisitController(), fenix: true);
    Get.lazyPut<GalleryController>(() => GalleryController(), fenix: true);
    Get.lazyPut<MapController>(() => MapController(), fenix: true);
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController(), fenix: true);
    Get.lazyPut<ReportController>(() => ReportController());
    Get.lazyPut<SignatureController>(() => SignatureController(), fenix: true);
  }
}
