import 'dart:math';
import 'dart:ui';

import 'package:curved_text/curved_text.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
    initialRoute: '/stories/curved-text',
    children: [
      Story(
        background: Colors.white,
        name: 'Curved text',
        builder: (_, k) {
          final curvature = k.slider(label: 'Curvature', initial: double.minPositive, min: -0.05, max: 0.05);

          final text = k.text(
            label: 'Text',
            initial: 'Hello, Flutter!',
          );
          const textStyle = TextStyle(fontSize: 18, color: Colors.black);

          return CurvedText(
            curvature: curvature,
            text: text,
            textStyle: textStyle,
          );
        },
      )
    ],
  );
}

