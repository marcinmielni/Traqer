import 'dart:async';
import 'location_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';

class GpxWriter{


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  StreamSubscription<Position> gpxSubscription(){

  }

  void createGpx(){

  }
}