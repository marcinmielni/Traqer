import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


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

  @override
  void didUpdateWidget(covariant Meter oldWidget) {
    super.didUpdateWidget(oldWidget);
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
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Theme.of(context).colorScheme.surface,
        ),
        width: double.infinity,
        // constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text(widget.name, style: Theme.of(context).textTheme.bodyLarge),
          Text(widget.value, style: Theme.of(context).textTheme.bodyMedium),
        ]
      ),
    ),
    );
  }
}
