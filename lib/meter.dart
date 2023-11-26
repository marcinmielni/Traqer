import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Flexible(
      child : Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        width: double.infinity,
        // constraints: BoxConstraints.expand(),
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
