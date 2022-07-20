import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/visit_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/views/screens/gallery/gallery_screen.dart';
import 'package:yendoc/views/screens/map/map_screen.dart';
import 'package:yendoc/views/widgets/common/checkbox_custom.dart';
import 'package:yendoc/views/widgets/common/drawer/drawer_menu.dart';
import 'package:yendoc/views/widgets/common/row_item_info.dart';
import 'package:yendoc/views/widgets/common/simple_scroll.dart';
import 'package:yendoc/views/widgets/common/text_field_custom.dart';

class VisitScreen extends GetView<VisitController> {
  final VisitEntity visit;
  final bool? readOnly;

  const VisitScreen({
    Key? key,
    required this.visit,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DefaultTabController(
          length: 3,
          child: GetBuilder<VisitController>(
            initState: (state) async => await controller.init(visit),
            builder: (controller) {
              return Scaffold(
                backgroundColor: Colors.white,
                drawer: const DrawerMenu(),
                drawerEdgeDragWidth: SizeConfig.screenWidth / 5,
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    Localization.xDrawer.visit,
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
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SimpleScroll(
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
                                onChanged: (value) => controller.onCheckboxCovidTapped(value!),
                                enabled: !readOnly!,
                              ),
                              RowItemInfo(
                                title: Localization.xVisit.diagnostic,
                              ),
                              TextFieldCustom(
                                controller: controller.textDiagnosticController,
                                keyboardType: TextInputType.multiline,
                                initialValue: visit.diagnostic,
                                maxLenght: 500,
                                lines: 8,
                                style: const TextStyle(fontSize: 14),
                                enabled: !readOnly!,
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: MapScreen(
                          visit: controller.visit,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GalleryScreen(
                          visit: controller.visit,
                          readOnly: readOnly,
                        ),
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
                      onTap: (index) => controller.onItemTapped(index, context, readOnly!),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
