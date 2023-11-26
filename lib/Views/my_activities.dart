import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyActivities extends StatefulWidget{

  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My activities"),
      ),
      body: const Center(child: Text("List of activities")), //TODO: Render list of past activities from local_path/activities
    );
  }
}