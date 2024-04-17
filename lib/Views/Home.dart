import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:traqer/Models/Decorators/track_decorator.dart';
import 'package:traqer/Models/track_reader.dart';
import 'package:traqer/Views/Widgets/menu.dart';
import 'package:traqer/Views/Widgets/meter.dart';
import 'package:traqer/Views/training_live.dart';
import 'live_data.dart';
import 'map.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  late double sevenDaysDistance;
  late Duration sevenDaysTime;

  Future<double> _getSevenDaysDistance() async{
    List<FileSystemEntity> items = await TrackReader.getGpxList();
    return await TrackDecorator.getSevenDaysDistance(items);
  }

  Future<Duration> _getSevenDaysTime() async {
    List<FileSystemEntity> items = await TrackReader.getGpxList();
    return await TrackDecorator.getSevenDaysTime(items);
  }

  @override
  void initState(){
    _getSevenDaysDistance().then((value) {
      setState(() {
        sevenDaysDistance = value;
      });
    });
    _getSevenDaysTime().then((value) {
      setState(() {
        sevenDaysTime = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: const Color(0xFF56358B),
        floatingActionButton: const Menu(),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: const Color(0xFF56358B)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.play_arrow, size: 200, color: Colors.green),
                  Text("Start training!", style: TextStyle(fontSize: 40, color: Colors.green)),
                ],),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrainingLive()
                  ),
                ).then((_) {
                  _getSevenDaysDistance().then((value) {
                    setState(() {
                      sevenDaysDistance = value;
                    });
                  });
                  _getSevenDaysTime().then((value){
                    setState(() {
                      sevenDaysTime = value;
                    });
                  }
                  );
                });
              },
            ),
              Container(height: 50),
              SizedBox(
                height: 250,
                width: 350,
                child: Column(
                  children: <Widget>[
                    Meter("Time this week", "${sevenDaysTime.inHours.toString().padLeft(2, '0')}:${(sevenDaysTime.inMinutes%60).toString().padLeft(2, '0')}:${(sevenDaysTime.inSeconds%60).toString().padLeft(2, '0')}", false),
                    Container(height: 60),
                    Meter("KM this week", sevenDaysDistance.toStringAsFixed(3), false),
                  ]
                ),
              )
        ])
      );
  }
}