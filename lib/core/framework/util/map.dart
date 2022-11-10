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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 6,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Seleccione una aplicación",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...availableMaps.asMap().entries.map(
                        (map) {
                          return Material(
                            type: MaterialType.card,
                            child: InkWell(
                              onTap: () => map.value.showMarker(
                                coords: Coords(latitude, longitude),
                                title: Localization.xMap.patient,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          map.value.icon,
                                          height: 30.0,
                                          width: 30.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            map.value.mapName,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (map.key != availableMaps.length - 1)
                                    const Divider(
                                      height: 0,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
