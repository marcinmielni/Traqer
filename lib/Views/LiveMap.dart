import 'package:flutter/material.dart';

class LiveMap extends StatelessWidget {

  const LiveMap({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,
      child: const Text(
        "LiveMap",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white)),
    );
  }
}