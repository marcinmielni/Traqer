import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,
      child: const Text(
        "Home",
        textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white)
      ),
    );
  }
}