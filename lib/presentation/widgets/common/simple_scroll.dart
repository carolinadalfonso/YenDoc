import 'package:flutter/material.dart';

class SimpleScroll extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;
  final bool onlyDisableGlobe;

  const SimpleScroll({
    Key? key,
    required this.child,
    this.scrollDirection = Axis.vertical,
    this.onlyDisableGlobe = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: onlyDisableGlobe
          ? child
          : SingleChildScrollView(
              child: child,
              scrollDirection: scrollDirection,
              physics: const ScrollPhysics(),
            ),
    );
  }
}
