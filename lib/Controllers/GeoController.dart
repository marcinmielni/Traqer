import 'package:geolocator/geolocator.dart';

class GeoController {
  GeoController(String S) async {
    LocationPermission permission = await Geolocator.checkPermission();
  }

  String[] GetPosition(){
    return ;
  }
  Future<void> streamPosition() async {
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
      print("GPS Location permission granted."); //Do actual tracking after permissions granted
    }
  }
}

