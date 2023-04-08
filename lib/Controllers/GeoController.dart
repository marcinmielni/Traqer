import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:io';

import 'package:traqer/Controllers/GeoController.dart';


class GeoController extends StatefulWidget {

  const GeoController({Key? key}) : super(key: key);

  /*
  GeoController(String S) async {
    LocationPermission permission = await Geolocator.checkPermission();
    Stream<Position>;
  }
  
   */

/*
  void writePosition(File f, Stream<Position> stream){
    f.open(mode: FileMode.write);
    f.
  }
 */

  @override
  State<GeoController> createState() => _GeoControllerState();
}
class _GeoControllerState extends State<GeoController>{


  Future<Position> _determinePosition() async {
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
    return await Geolocator.getCurrentPosition();
  }

  Stream<Position> streamPosition() async* {
    LocationPermission permission = await Geolocator.checkPermission();
      while(Tracking.active()){//Do actual tracking after permissions granted
        yield _determinePosition();
      }
    }
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 3,
  );
  @override
  void initState() {
    super.initState();
    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      // do what you want to do with the position here
    });
  }
  }

