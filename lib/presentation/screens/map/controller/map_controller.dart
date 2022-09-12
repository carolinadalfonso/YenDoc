import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/domain/entities/visit_entity.dart';

import '../../../../core/framework/util/map.dart';

class MapController {
  late VisitEntity visit;
  Set<Marker> markers = <Marker>{};
  Completer<GoogleMapController> completerMapController = Completer();

  init(VisitEntity visit) {
    completerMapController = Completer();
    this.visit = visit;
    markers.clear();
    setMedicLocationData();
  }

  void onMapCreated(GoogleMapController googleMapController) async {
    if (completerMapController.isCompleted) {
      final GoogleMapController controller = await completerMapController.future;
      Timer(const Duration(milliseconds: 500), () async {
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(visit.latitude, visit.longitude),
              zoom: 14.5,
            ),
          ),
        );
      });
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
  }

  goToGoogleMap(BuildContext context) {
    MapUtils.openMaps(context, visit.latitude, visit.longitude);
  }
}
