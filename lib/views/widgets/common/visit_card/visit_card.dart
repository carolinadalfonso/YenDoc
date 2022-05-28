import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/controllers/visit_card_controller.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class VisitCard extends GetView<VisitCardController> {
  final VisitEntity visit;

  const VisitCard({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        highlightColor: ThemeManager.kPrimaryColor100,
        borderRadius: BorderRadius.circular(8),
        onTap: () => controller.goToVisit(visit),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: controller.getStateColor(visit.state.code),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                height: 58,
                width: 50,
                child: Icon(
                  controller.getStateIcon(visit.state.code),
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextScroll(
                        visit.patient,
                        mode: TextScrollMode.bouncing,
                        velocity: const Velocity(pixelsPerSecond: Offset(15, 0)),
                        delayBefore: const Duration(seconds: 2),
                        pauseBetween: const Duration(seconds: 5),
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: TextScroll(
                              visit.address,
                              style: TextStyle(color: Colors.grey[500], fontSize: 12),
                              mode: TextScrollMode.bouncing,
                              velocity: const Velocity(pixelsPerSecond: Offset(15, 0)),
                              delayBefore: const Duration(seconds: 2),
                              pauseBetween: const Duration(seconds: 5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
