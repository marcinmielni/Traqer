import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationController{

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
}