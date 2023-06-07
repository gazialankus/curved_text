library curved_text;

import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

/// Creates a curved text that curves in place.
/// This needs to be sized with external constraints.
/// The center of your text (not the center of a virtual circle) is at the
/// center of the widget. Therefore you do not have to worry about a radius.
/// You just give curvature, which is 1/radius, and the text curls in place.
class CurvedText extends StatelessWidget {
  const CurvedText({
    required this.curvature,
    required this.text,
    required this.textStyle,
    super.key,
  });

  final double curvature;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    const maxRadius = 100000;
    final desiredRadius = 1 / curvature.abs();
    final radius = desiredRadius.abs() > maxRadius ? desiredRadius.sign * maxRadius : desiredRadius;

    final yTranslate = curvature.isNegative ? -radius : radius;
    final direction = curvature.isNegative ? Direction.counterClockwise : Direction.clockwise;
    final startAngle = curvature.isNegative ? pi : 0;

    return ArcText(
      direction: direction,
      radius: radius,
      text: text,
      textStyle: textStyle,
      startAngle: startAngle.toDouble(),
      startAngleAlignment: StartAngleAlignment.center,
      placement: Placement.middle,
      painterDelegate: (canvas, size, painter) {
        canvas.translate(0, yTranslate);
        painter.paint(canvas, size);
      },
    );
  }
}
