import 'dart:async';
import 'location_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';

class GpxWriter{

  late StreamSubscription<Position> streamSubscription;

  void createGpx(){
    String _path = _localPath as String;
    //TODO:add creation logic
  }

  void start(){
    streamSubscription = Geolocator.getPositionStream().listen(_writePositionToGpx);
  }

  void resume(){
    streamSubscription.resume();
  }

  void pause(){
    streamSubscription.pause();
  }

  void cancel(){
    streamSubscription.cancel();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void _writePositionToGpx(){
    //TODO:add writing logic
  }

  void gameplan(){

    late bool isActive;

    start();
    createGpx();
    while(isActive){
      _writePositionToGpx();
    }
    cancel();
    //save()
  }




}