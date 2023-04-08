import 'package:flutter/material.dart';

class Archive extends StatelessWidget {

  const Archive({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,
      child: const Text(
          "Archive",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white)),
    );
  }
}