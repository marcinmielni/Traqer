import 'dart:async';
import 'package:gpx/gpx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traqer/Controllers/track_writer.dart';



class LocationController{

  static LocationSettings locationSettings = AndroidSettings(
    forceLocationManager: true,
    accuracy: LocationAccuracy.high,
    foregroundNotificationConfig: const ForegroundNotificationConfig(
        notificationTitle: 'Tracking',
        notificationText: 'in progress',
        //notificationIcon: AndroidResource(name: 'ic_launcher_foreground', defType: 'mipmap-hdpi'),
        enableWakeLock: true,
        setOngoing: true,
    ),
    intervalDuration: const Duration(seconds: 3)
  );

  static Position? position;
  static Stream<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).asBroadcastStream();

  static StreamSubscription<Position>? positionStreamSubscription;
  // static StreamSubscription<Position>? gpxStreamSubscription;

  static Future<void> getPosition() async{
    Geolocator.getCurrentPosition().then((Position _position){
      position = _position;
    },
        onError: (e){
          position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0);
        });
  }

  static void startTracking(){
    TrackWriter.initGpx();
    LocationController.positionStreamSubscription = LocationController.positionStream.listen(
            (Position? _position) {
          print(position == null ? 'Unknown' : '${_position?.latitude.toString()}, ${_position?.longitude.toString()}');
          TrackWriter.addTrackPoint(Wpt(lat: _position?.latitude,lon: _position?.longitude));
          LocationController.position = _position!;
        });
    //print("start");
  }

  static void stopTracking(){
    LocationController.positionStreamSubscription?.pause();
    LocationController.positionStreamSubscription = null;
    TrackWriter.saveGpx();
    //print("null");
  }
}