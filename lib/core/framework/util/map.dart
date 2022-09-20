import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import '../localization/localization.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMaps(BuildContext context, double latitude, double longitude) async {
    final availableMaps = await MapLauncher.installedMaps;

    if (availableMaps.length == 1) {
      await availableMaps.first.showMarker(
        coords: Coords(latitude, longitude),
        title: Localization.xMap.patient,
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () => map.showMarker(
                        coords: Coords(latitude, longitude),
                        title: Localization.xMap.patient,
                      ),
                      title: Text(map.mapName),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
