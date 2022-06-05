import 'package:flutter/material.dart';

class SimpleScroll extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;

  const SimpleScroll({
    Key? key,
    required this.child,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: child,
        scrollDirection: scrollDirection,
        physics: const ScrollPhysics(),
      ),
    );
  }
}
