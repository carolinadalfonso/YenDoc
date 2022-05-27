import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/visit_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

class VisitScreen extends GetView<VisitController> {
  const VisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          foregroundColor: ThemeManager.kPrimaryColor,
          backgroundColor: Colors.white,
          title: Text(
            Localization.xDrawer.visit,
            style: TextStyle(color: ThemeManager.kPrimaryColor),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: ColoredBox(
              color: ThemeManager.kPrimaryColor50,
              child: TabBar(
                tabs: [
                  Tab(
                    height: 17,
                    child: Text(Localization.xVisit.detail),
                  ),
                  Tab(
                    height: 17,
                    child: Text(Localization.xVisit.map),
                  ),
                  Tab(
                    height: 17,
                    child: Text(Localization.xVisit.photos),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("hola"),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("hola1"),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("hola2"),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<VisitController>(
            init: controller,
            builder: (controller) {
              return BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.signature), //or penFancy
                    label: Localization.xVisit.signature,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.camera),
                    label: Localization.xVisit.camera,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.flagCheckered),
                    label: Localization.xVisit.finish,
                  ),
                ],
                currentIndex: controller.selectedIndex,
                onTap: (index) => controller.onItemTapped(index),
              );
            }),
      ),
    );
  }
}
