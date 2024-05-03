import 'package:flutter/material.dart';
import 'package:traqer/Controllers/location_controller.dart';

import 'package:traqer/main.dart';

class StartStopButton extends StatefulWidget {

  final VoidCallback onPressed;

  const StartStopButton({super.key, required this.onPressed});


  @override
  State<StartStopButton> createState() => _StartStopButtonState();
}

class _StartStopButtonState extends State<StartStopButton> {

  static const List<(Color? background, Widget?)> customizations =
  <(Color?, Widget?)>[
    (Colors.green, Icon(Icons.play_arrow, color: Colors.black)),
    (Colors.red, Icon(Icons.pause, color: Colors.black,)),
  ];

  static int index = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
        onPressed: () {
          setState(() {
            index = (index + 1) % customizations.length;
            widget.onPressed.call();
          });
          if(LocationController.positionStreamSubscription == null ){
            LocationController.startTracking();
          }else{
            LocationController.stopTracking();
          }

        },
        backgroundColor: customizations[index].$1,
        child: customizations[index].$2,
      );
  }
}