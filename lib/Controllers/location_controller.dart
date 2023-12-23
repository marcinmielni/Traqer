import 'dart:async';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class LocationController{

  static LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );
  static late LatLng position;
  static final Stream<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings);

  static StreamSubscription<Position>? positionStreamSubscription;
  static StreamSubscription<Position>? gpxStreamSubscription;

  static Future<int?> getPosition() async{
    Geolocator.getCurrentPosition().then((Position _position){
      position = LatLng(_position.latitude, _position.longitude);
    },
        onError: (e){
          position = const LatLng(21, 37);
          return 1;
        });
    return 0;
  }

  // var locationMessage = "";
  //
  //
  // static Stream<Position> positionStream(Duration interval) {
  //   late StreamController<Position> controller;
  //   Timer? timer;
  //
  //   Future<void> tick(_) async {
  //     var lastPosition = await getCurrentLocation();
  //     controller.add(lastPosition);
  //   }
  //
  //   void start(){
  //     print("Stream started");
  //     timer = Timer.periodic(interval, tick);
  //   }
  //
  //   void stop(){
  //     print("Stream stopped");
  //     timer?.cancel();
  //     timer=null;
  //   }
  //
  //   controller = StreamController<Position>(
  //       onListen: start,
  //       onPause: stop,
  //       onResume: start,
  //       onCancel: stop);
  //
  //   return controller.stream;
  // }
  //
  //
  // static Future<Position> getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   var position = await Geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   //var lastPosition = await Geolocator.getLastKnownPosition();
  //   //print([position.latitude, position.longitude, position.altitude, position.speed, position.heading]);
  //   return position;
  //}
}