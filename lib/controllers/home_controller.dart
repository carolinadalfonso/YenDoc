import 'package:get/get.dart';

class HomeController extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update();
  }

  void decrement() {
    counter--;
    update();
  }
}
