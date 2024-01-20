import 'dart:io';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class Permissions {
  static Future<bool> requestRequiredPermissions() async{
    Location location = Location();

    bool serviceEnabled;
    ph.PermissionStatus permissionStatus;
    //LocationData locationData;

    //Request location service to be enabled, closes app otherwise
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        exit(0);
      }
    }

    permissionStatus = await ph.Permission.locationWhenInUse.request();
    if(permissionStatus.isGranted){
      permissionStatus = await ph.Permission.locationAlways.request();
      if(!permissionStatus.isGranted) {
        print('permissions denid');
      }
    }else{
      exit(0);
    }
    //locationData = await location.getLocation();
    return true; //TODO: remove
  }
}