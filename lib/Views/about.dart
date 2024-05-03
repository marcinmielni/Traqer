import 'package:flutter/material.dart';

class About extends StatefulWidget{

  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("About this app"),
      ),
      body: const Center(child: Text("This app was created by Marcin Mielniczuk")),
    );
  }
}