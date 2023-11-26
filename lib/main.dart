import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traqer/Builders/dialog_builder.dart';
import 'package:traqer/permissions.dart';
import 'Controllers/location_controller.dart';
import 'Views/Home.dart';
import 'Views/LocationApp.dart';
import 'Views/liveData.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Traqer());
}

class Traqer extends StatefulWidget {

  const Traqer({Key? key}) : super(key: key);
  
  @override
  State<Traqer> createState() => _TraqerState();
}

class _TraqerState extends State<Traqer> {

  

  Stream<Position> positionStr = LocationController.positionStream(const Duration(seconds: 5));

  late StreamSubscription<Position> subscription;
  Position _lastPosition = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0, isMocked: true);

  @override
  void initState(){
    subscription = positionStr.listen((event) {
      setState(() {
        _lastPosition = event;
      });
    });
    subscription.pause();
    super.initState();
  }



  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traqer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}

