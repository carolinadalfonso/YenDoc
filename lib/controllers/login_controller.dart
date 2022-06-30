import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yendoc/views/screens/home/home_screen.dart';

export 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController textUserController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  login() {
    Get.to(() => HomeScreen(datePick: DateTime.now()));
  }
}
