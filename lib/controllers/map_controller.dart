import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class MapController extends GetxController {
  late VisitEntity visit;
  late GoogleMapController mapController;
  late LatLng _medicLocationData;
  List<Marker> markers = <Marker>[];

  init(VisitEntity visit) async {
    this.visit = visit;
    markers.clear();
  }

  setMedicLocationData(double latitude, double longitude) async {
    _medicLocationData = LatLng(latitude, longitude);

    if (markers.isEmpty) {
      markers.add(
        Marker(
          markerId: const MarkerId("medicLocation"),
          position: _medicLocationData,
          infoWindow: InfoWindow(title: Localization.xMap.you),
        ),
      );
    }

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 400),
      "assets/images/pin.png",
    );

    markers.add(
      Marker(
          markerId: const MarkerId("patientLocation"),
          position: LatLng(visit.latitude, visit.longitude),
          infoWindow: InfoWindow(title: Localization.xMap.patient),
          icon: markerbitmap),
    );

    update();
  }
}
