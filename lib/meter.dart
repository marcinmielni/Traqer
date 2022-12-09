import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traqer/Pages/liveData.dart';

class Meter extends StatefulWidget {

  final String name;
  final double value;

  const Meter(this.name, this.value);

  @override
  State<Meter> createState() => _MeterState();
}

class _MeterState extends State<Meter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child : Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text(widget.name, style: const TextStyle(fontSize: 22)),
          Text(widget.value.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
        ]
      ),
    ),
    );
  }
}
