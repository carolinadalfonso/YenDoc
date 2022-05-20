import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/widgets/common/drawer/drawer_menu.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Localization.xDrawer.visits),
      ),
      drawer: const DrawerMenu(),
      drawerEdgeDragWidth: SizeConfig.screenWidth / 4.5,
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
            Container(
              height: 100,
              width: 100,
              color: ThemeManager.kPrimaryColor,
            ),
            Container(
              height: 100,
              width: 100,
              color: ThemeManager.kPrimaryColor100,
            ),
            Container(
              height: 100,
              width: 100,
              color: ThemeManager.kPrimaryColor50,
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
