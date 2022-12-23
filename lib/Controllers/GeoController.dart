import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:io';


class GeoController {
  GeoController(String S) async {
    LocationPermission permission = await Geolocator.checkPermission();
    Stream<Location>;
  }

  Future<Location> GetPosition(Stream<Location> stream){
    return ;
  }
  void writePosition(File f, Stream<Location> stream){
    f.open(mode: FileMode.write);
    f.
  }

  Stream<Location> streamPosition() async* {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }else if(permission == LocationPermission.deniedForever){
        print("'Location permissions are permanently denied");
      }else{
        print("GPS Location service is granted");
      }
    }else{
      while(TODO: Implement switch){//Do actual tracking after permissions granted
        yield GetPosition();
      }
    }
  }

}

