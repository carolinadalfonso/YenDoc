import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yendoc/controllers/map_controller.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class MapScreen extends GetView<MapController> {
  final VisitEntity visit;

  const MapScreen({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      initState: (state) => controller.init(visit),
      builder: (controller) {
        return Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController googleMapController) {
                if (!controller.completerMapController.isCompleted) {
                  controller.completerMapController.complete(googleMapController);
                }
                controller.onMapCreated(googleMapController);
              },
              markers: controller.markers,
              myLocationEnabled: false,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 1,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35, left: 10),
                child: FloatingActionButton(
                  backgroundColor: ThemeManager.kPrimaryColor,
                  onPressed: () {
                    controller.goToGoogleMap(context);
                  },
                  child: const Icon(FontAwesomeIcons.locationArrow),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
