import 'package:flutter/material.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/controllers/visit_card_controller.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

class VisitCard extends GetView<VisitCardController> {
  final IconData icon;
  final Color iconColor;
  final int visitId;

  const VisitCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.visitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        highlightColor: ThemeManager.kPrimaryColor100,
        borderRadius: BorderRadius.circular(8),
        onTap: () => controller.visit(),
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
                  color: iconColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                height: 58,
                width: 50,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Bernie Flecha"),
                    Text(
                      "Caracas 1510",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
