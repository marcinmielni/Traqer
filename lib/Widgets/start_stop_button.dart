import 'package:flutter/material.dart';
import 'package:traqer/Controllers/location_controller.dart';

import '../main.dart';

class StartStopButton extends StatefulWidget {

  //final VoidCallback onPressed;

  StartStopButton({super.key});


  @override
  State<StartStopButton> createState() => _StartStopButtonState();



  // StreamSubscription<Position>? get positionStreamSubscription => _positionStreamSubscription;
  // set positionStreamSubscription(StreamSubscription<Position>? streamSubscription){
  //   _positionStreamSubscription = streamSubscription;
  // }

}

class _StartStopButtonState extends State<StartStopButton> {

  static const List<(Color? background, Widget?)> customizations =
  <(Color?, Widget?)>[
    (Colors.green, Icon(Icons.play_arrow)),
    (Colors.red, Icon(Icons.pause)),
  ];
  static int index = 0;

  // late Function onPressed;
  /*
  Geolocator.getPositionStream(locationSettings: locationSettings).listen(
          (Position? position) {
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
      });

   */

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
        onPressed: () {
          setState(() {
            index = (index + 1) % customizations.length;
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