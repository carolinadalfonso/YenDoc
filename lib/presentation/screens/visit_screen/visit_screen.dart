import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:yendoc/presentation/screens/visit_screen/controller/visit_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/domain/entities/responses/visit_entity.dart';
import 'package:yendoc/presentation/screens/gallery/gallery_screen.dart';
import 'package:yendoc/presentation/screens/map/map_screen.dart';
import 'package:yendoc/presentation/widgets/common/checkbox_custom.dart';
import 'package:yendoc/presentation/widgets/common/row_item_info.dart';
import 'package:yendoc/presentation/widgets/common/simple_scroll.dart';
import 'package:yendoc/presentation/widgets/common/text_field_custom.dart';

import '../../widgets/common/drawer/drawer_menu.dart';

class VisitScreen extends StatefulWidget {
  final VisitEntity visit;
  final DateTime datePick;
  final bool? readOnly;

  const VisitScreen({
    Key? key,
    required this.visit,
    required this.datePick,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<VisitScreen> createState() => _VisitScreenState();
}

class _VisitScreenState extends State<VisitScreen> {
  final VisitController controller = VisitController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() => setState(() => {}));
    controller.setVisit(widget.visit);
    controller.setPossibleCovid(widget.visit.posibleCovid);
    controller.getFirstCamera();
  }

  @override
  void dispose() {
    super.dispose();
    controller.textDiagnosticController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            drawer: const DrawerMenu(),
            drawerEdgeDragWidth: SizeConfig.screenWidth / 5,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: DateTime.now().difference(widget.datePick).inDays == 0
                  ? Text(Localization.xDrawer.visit)
                  : Text("${Localization.xReport.visit}${DateFormat("dd/MM/yyyy").format(widget.datePick)}"),
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
                            value: widget.visit.patient,
                          ),
                          RowItemInfo(
                            title: Localization.xVisit.address,
                            value: widget.visit.address,
                          ),
                          RowItemInfo(
                            title: Localization.xVisit.age,
                            value: "${widget.visit.age} ${Localization.xCommon.yearsOld}",
                          ),
                          RowItemInfo(
                            title: Localization.xVisit.symptoms,
                            value: widget.visit.symptoms,
                          ),
                          CheckboxCustom(
                            text: Localization.xVisit.posibleCovid,
                            checked: controller.possibleCovid,
                            onChanged: (value) => controller.onCheckboxCovidTapped(value!),
                            enabled: !widget.readOnly!,
                          ),
                          RowItemInfo(
                            title: Localization.xVisit.diagnostic,
                          ),
                          TextFieldCustom(
                            controller: controller.textDiagnosticController,
                            keyboardType: TextInputType.multiline,
                            initialValue: widget.visit.diagnostic,
                            maxLenght: 500,
                            lines: 8,
                            style: const TextStyle(fontSize: 14),
                            enabled: !widget.readOnly!,
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
                      readOnly: widget.readOnly,
                      controller: controller.galleryController,
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
                child: Theme(
                  data: ThemeManager.getTheme().copyWith(
                    splashFactory: widget.readOnly! ? NoSplash.splashFactory : InkSplash.splashFactory,
                  ),
                  child: BottomNavigationBar(
                    selectedIconTheme:
                        widget.readOnly! ? IconThemeData(color: ThemeManager.kPrimaryColor100) : IconThemeData(color: ThemeManager.kPrimaryColor),
                    selectedItemColor: widget.readOnly! ? ThemeManager.kPrimaryColor100 : ThemeManager.kPrimaryColor,
                    unselectedIconTheme:
                        widget.readOnly! ? IconThemeData(color: ThemeManager.kPrimaryColor100) : IconThemeData(color: ThemeManager.kPrimaryColor),
                    unselectedItemColor: widget.readOnly! ? ThemeManager.kPrimaryColor100 : ThemeManager.kPrimaryColor,
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
                    onTap: (index) => controller.onItemTapped(index, context, widget.readOnly!),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
