import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main.dart';

class AnimatedButton extends StatefulWidget {

  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {

  static const List<(Color? background, Widget?)> customizations =
  <(Color?, Widget?)>[
    (Colors.green, Icon(Icons.play_arrow)),
    (Colors.red, Icon(Icons.pause)),
  ];
  static int index = 0; // Selects the customization.

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
        onPressed: () {
          setState(() {
            index = (index + 1) % customizations.length;
          });

        },
        backgroundColor: customizations[index].$1,
        child: customizations[index].$2,
      );
  }
}