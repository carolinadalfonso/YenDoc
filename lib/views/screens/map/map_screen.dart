import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:yendoc/controllers/map_controller.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class MapScreen extends GetView<MapController> {
  final VisitEntity visit;

  const MapScreen({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Location _location = Location();

    void _onMapCreated(GoogleMapController googleMapController) {
      controller.mapController = googleMapController;
      _location.onLocationChanged.listen((l) {
        controller.setMedicLocationData(l.latitude!, l.longitude!);
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(l.latitude!, l.longitude!),
              zoom: 14.5,
            ),
          ),
        );
      });
    }

    return GetBuilder<MapController>(
      initState: (state) async => await controller.init(visit),
      init: controller,
      builder: (controller) {
        return GoogleMap(
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(controller.markers),
          myLocationEnabled: true,
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 1,
          ),
        );
      },
    );
  }
}
