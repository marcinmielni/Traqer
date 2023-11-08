import 'dart:async';
import 'location_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';

class GpxWriter{


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Stream<Position> gpxStream(Duration interval) {
    late StreamController<Position> controller;
    Timer? timer;
    Position lastPosition;

    Future<void> tick(_) async {
      lastPosition = await LocationController.getCurrentLocation();
      controller.add(lastPosition);
      //TODO:append last position to .gpx file at tracks/_localPath
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

  void createGpx(){

  }
}