import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationApp extends StatefulWidget {

  const LocationApp({Key? key}) : super(key:key);

  @override
  State<LocationApp> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {


  var locationMessage = "";


  Stream<Position> positionStream(Duration interval) {
    late StreamController<Position> controller;
    Timer? timer;
    Position lastPosition;

    Future<void> tick(_) async {
      var lastPosition = await getCurrentLocation();
      controller.add(lastPosition);
    }

    void start(){
      print("Stream started");
      timer = Timer.periodic(interval, tick);
    }

    void stop(){
      print("Stream stopped");
      timer?.cancel();
      timer=null;
    }

    controller = StreamController<Position>(
      onListen: start,
      onPause: stop,
      onResume: start,
      onCancel: stop);

    return controller.stream;
  }


  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "$position";
    });
    return position;
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Location Services"),

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              size:46.0,
              color: Colors.blue
            ),
            const SizedBox(
              height: 10.0
            ),
            const Text(
              "Get user Location",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Position: $locationMessage"),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)
              ),
              onPressed: () {
                if(subscription.isPaused) {
                  subscription.resume();
                }else{
                  subscription.pause();
                }
              },
              child: const Text("Get current Location",
                style: TextStyle(
                  color: Colors.white,
              )),
            )
          ],
        )
      )
    );
  }
}