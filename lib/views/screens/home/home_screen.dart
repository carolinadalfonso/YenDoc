import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yendoc/controllers/home_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/models/visit/visit_model.dart';
import 'package:yendoc/models/visit_state/visit_state_model.dart';
import 'package:yendoc/views/widgets/common/drawer/drawer_menu.dart';
import 'package:yendoc/views/widgets/common/visit_card/visit_card.dart';

class HomeScreen extends GetView<HomeController> {
  final DateTime datePick;
  final bool? readOnly;

  const HomeScreen({
    Key? key,
    required this.datePick,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: DateTime.now().difference(datePick).inDays == 0
              ? Text(Localization.xDrawer.visits)
              : Text("${Localization.xReport.visits}${DateFormat("dd/MM/yyyy").format(datePick)}"),
        ),
        drawer: const DrawerMenu(),
        drawerEdgeDragWidth: SizeConfig.screenWidth / 4.5,
        body: GetBuilder<HomeController>(
          initState: (state) async => await controller.init(),
          init: controller,
          builder: (controller) {
            return Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: SizeConfig.screenWidth / 1.1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ListView.builder(
                    itemCount: getVisits(datePick).length,
                    itemBuilder: (context, index) {
                      VisitEntity visit = getVisits(datePick)[index];
                      return VisitCard(
                        visit: visit,
                        datePick: datePick,
                        readOnly: readOnly,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<VisitModel> getVisits(DateTime date) {
    List<VisitModel> visits = [
      VisitModel(
        id: 1,
        patient: "Wally Flecha",
        address: "Hortiguera 630, CABA, Buenos Aires",
        age: 22,
        symptoms: "Fiebre y tos",
        posibleCovid: true,
        state: VisitStateModel(id: 1, code: "DONE", name: "Realizado"),
        latitude: -34.62447794860064,
        longitude: -58.44468894799918,
      ),
      VisitModel(
        id: 2,
        patient: "Luna Montgomery",
        address: "Av. Juan Bautista Alberdi 1230, CABA, Buenos Aires",
        age: 24,
        symptoms: "Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad Mucosidad ",
        posibleCovid: false,
        state: VisitStateModel(id: 2, code: "NOT_DONE", name: "No Realizada"),
        latitude: -34.62551330115694,
        longitude: -58.44828866888042,
      ),
      VisitModel(
        id: 3,
        patient: "Bernie Gutierrez",
        address: "Av. Directorio 2410, CABA, Buenos Aires",
        age: 23,
        symptoms: "Dolor de espalda",
        posibleCovid: false,
        state: VisitStateModel(id: 3, code: "IN_PROGRESS", name: "En curso"),
        latitude: -34.629956690759094,
        longitude: -58.44717897548767,
      ),
      VisitModel(
        id: 4,
        patient: "Juan Carlos Dominguez",
        address: "Membrillar 80, CABA, Buenos Aires",
        age: 21,
        symptoms: "Dolores",
        posibleCovid: false,
        state: VisitStateModel(id: 4, code: "PENDING", name: "Pendiente"),
        latitude: -34.630357560127365,
        longitude: -58.450120094912464,
      ),
    ];
    return visits;
  }
}
