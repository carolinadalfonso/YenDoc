import 'package:get/get.dart';
import 'package:yendoc/controllers/home_controller.dart';

class InjectionContainer extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
