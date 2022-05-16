import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/home_controller.dart';

class HomeScreenX extends GetView<HomeController> {
  const HomeScreenX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YenDoc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<HomeController>(
              init: controller,
              builder: (controller) {
                return Text(
                  controller.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            IconButton(
              onPressed: () => controller.increment(),
              icon: const Icon(FontAwesomeIcons.plus),
              splashRadius: 20,
              splashColor: Colors.deepPurpleAccent,
              color: Colors.deepPurple,
            ),
            IconButton(
              onPressed: () => controller.decrement(),
              icon: const Icon(FontAwesomeIcons.minus),
              splashRadius: 20,
              splashColor: Colors.deepPurpleAccent,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
