import 'dart:io';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class Permissions {
  static Future<bool> requestRequiredPermissions() async{
    Location location = Location();

    bool serviceEnabled;
    ph.PermissionStatus permissionStatus;

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
      }
    }else{
      exit(0);
    }
    return true;
  }
}