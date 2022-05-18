import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/widgets/common/list_item.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YenDoc"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: ThemeManager.kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeManager.kPrimaryColorLight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: CircleAvatar(
                            backgroundColor: ThemeManager.kPrimaryColor,
                            backgroundImage: const NetworkImage(
                              'https://avatars.githubusercontent.com/u/7302044?v=4',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Carolina D'Alfonso",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListItem(
              title: "Visitas",
              icon: FontAwesomeIcons.houseChimney,
              onTap: () => {},
            ),
            ListItem(
              title: "Acerca de",
              icon: FontAwesomeIcons.circleInfo,
              onTap: () => {},
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListItem(
                        title: "Cerrar sesión",
                        icon: FontAwesomeIcons.rightFromBracket,
                        onTap: () => {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
