import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/widgets/common/drawer/drawer_menu.dart';
import 'package:yendoc/views/widgets/common/visit_card/visit_card.dart';

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
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: SizeConfig.screenWidth / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              VisitCard(icon: FontAwesomeIcons.solidCircleCheck, iconColor: Colors.green, visitId: 4),
              VisitCard(icon: FontAwesomeIcons.solidCircleXmark, iconColor: Colors.red, visitId: 3),
              VisitCard(icon: FontAwesomeIcons.circleArrowRight, iconColor: Colors.black38, visitId: 2),
              VisitCard(icon: FontAwesomeIcons.solidClock, iconColor: Colors.black26, visitId: 1),
              // GetBuilder<HomeController>(
              //   init: controller,
              //   builder: (controller) {
              //     return Text(
              //       controller.counter.toString(),
              //       style: Theme.of(context).textTheme.headline6,
              //     );
              //   },
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: ThemeManager.kPrimaryColor,
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: ThemeManager.kPrimaryColor100,
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: ThemeManager.kPrimaryColor50,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
