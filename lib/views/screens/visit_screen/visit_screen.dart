import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/visit_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/views/screens/gallery/gallery_screen.dart';
import 'package:yendoc/views/widgets/common/checkbox_custom.dart';
import 'package:yendoc/views/widgets/common/drawer/drawer_menu.dart';
import 'package:yendoc/views/widgets/common/row_item_info.dart';
import 'package:yendoc/views/widgets/common/text_field_custom.dart';

class VisitScreen extends GetView<VisitController> {
  final VisitEntity visit;

  const VisitScreen({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: GetBuilder<VisitController>(
        initState: (state) async => await controller.init(visit),
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            drawer: const DrawerMenu(),
            drawerEdgeDragWidth: SizeConfig.screenWidth / 4.5,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              // foregroundColor: ThemeManager.kPrimaryColor,
              // backgroundColor: Colors.white,
              title: Text(
                Localization.xDrawer.visit,
                //style: TextStyle(color: ThemeManager.kPrimaryColor),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(45),
                child: Container(
                  height: 45,
                  color: Colors.white,
                  child: TabBar(
                    padding: const EdgeInsets.all(3),
                    tabs: [
                      Tab(
                        child: Text(Localization.xVisit.detail),
                      ),
                      Tab(
                        child: Text(Localization.xVisit.map),
                      ),
                      Tab(
                        child: Text(Localization.xVisit.photos),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowItemInfo(
                          title: Localization.xVisit.patient,
                          value: visit.patient,
                        ),
                        RowItemInfo(
                          title: Localization.xVisit.address,
                          value: visit.address,
                        ),
                        RowItemInfo(
                          title: Localization.xVisit.age,
                          value: "${visit.age} ${Localization.xCommon.yearsOld}",
                        ),
                        RowItemInfo(
                          title: Localization.xVisit.symptoms,
                          value: visit.symptoms,
                        ),
                        CheckboxCustom(
                            text: Localization.xVisit.posibleCovid,
                            checked: controller.possibleCovid,
                            onChanged: (value) => controller.onCheckboxCovidTapped(value!)),
                        RowItemInfo(
                          title: Localization.xVisit.diagnostic,
                        ),
                        TextFieldCustom(
                          controller: controller.textDiagnosticController,
                          keyboardType: TextInputType.multiline,
                          maxLenght: 500,
                          lines: 8,
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("hola1"),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: GalleryScreen(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 7, spreadRadius: 0, color: ThemeManager.kPrimaryColor100),
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: const Icon(FontAwesomeIcons.signature),
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
                  onTap: (index) => controller.onItemTapped(index),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
