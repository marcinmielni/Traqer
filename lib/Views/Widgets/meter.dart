import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traqer/Controllers/location_controller.dart';

class Meter extends StatefulWidget {

  String name;
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
  }

  // @override
  // void setState(VoidCallback fn) {
  //   value = position.speed.toString();
  //   super.setState(fn);
  // }

  @override
  void didUpdateWidget(covariant Meter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didWidgetUpdate");
    if(oldWidget.value != widget.value){
      print("The old widget with counter: ${oldWidget.value}  was replaced with new widget with counter: ${widget.value}");
    }
  }


  @override
  void dispose(){
    super.dispose();
  }


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
          Text(widget.value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
        ]
      ),
    ),
    );
  }
}
