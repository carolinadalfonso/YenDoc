import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yendoc/presentation/screens/map/controller/map_controller.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/domain/entities/visit_entity.dart';

class MapScreen extends StatefulWidget {
  final VisitEntity visit;

  const MapScreen({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController controller = MapController();

  @override
  void initState() {
    super.initState();

    controller.init(widget.visit);
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
