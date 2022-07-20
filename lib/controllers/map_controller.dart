import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

import '../core/framework/util/map.dart';

class MapController extends GetxController {
  late VisitEntity visit;
  List<Marker> markers = <Marker>[];
  Completer<GoogleMapController> completerMapController = Completer();

  init(VisitEntity visit) {
    this.visit = visit;
    markers.clear();
    setMedicLocationData();
  }

  onDispose() {
    completerMapController = Completer();
  }

  void onMapCreated(GoogleMapController googleMapController) async {
    if (completerMapController.isCompleted) {
      GoogleMapController controller = await completerMapController.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(visit.latitude, visit.longitude),
            zoom: 14.5,
          ),
        ),
      );
    }
  }

  setMedicLocationData() {
    markers.add(
      Marker(
        markerId: const MarkerId("patientLocation"),
        position: LatLng(visit.latitude, visit.longitude),
        infoWindow: InfoWindow(title: Localization.xMap.patient),
      ),
    );

    update();
  }

  goToGoogleMap() {
    MapUtils.openMap(visit.latitude, visit.longitude);
  }
}
