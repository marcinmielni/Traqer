import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traqer/Controllers/location_controller.dart';

class Meter extends StatefulWidget {

  final String name;
  String value;
  bool dynamic;

  Meter(this.name, this.value, this.dynamic, {super.key});

  @override
  State<Meter> createState() => _MeterState();
}

class _MeterState extends State<Meter> {

  late String value;
  late Position position;
  late StreamSubscription<Position>? positionStreamSubscription;



  @override
  void initState(){
    super.initState();
    if(widget.dynamic) {
      value = '0.00';
      positionStreamSubscription =
          LocationController.positionStream.listen((event) {
            setState(() {
              value = event.speed.toStringAsFixed(2);
            });
            print('${event.longitude}, ${event.latitude}, ${event.speed}');
          });
    }else{
      positionStreamSubscription = null;
      value = widget.value;
    }
  }

  @override
  void dispose(){
    positionStreamSubscription?.cancel();
    super.dispose();
  }

  // @override
  // void setState(VoidCallback fn) {
  //   value = position.speed.toString();
  //   super.setState(fn);
  // }


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child : Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Color(0xFFD9D9D9),
        ),
        width: double.infinity,
        // constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text(widget.name, style: const TextStyle(fontSize: 22)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
        ]
      ),
    ),
    );
  }
}
