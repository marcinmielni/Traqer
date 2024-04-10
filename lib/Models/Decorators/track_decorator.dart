import 'dart:ffi';
import 'dart:math';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';

class TrackDecorator{

  TrackDecorator();

  static String getTime(Gpx gpx){
    DateTime? last = gpx.trks[0].trksegs[0].trkpts.last.time ?? DateTime(0);
    DateTime? first = gpx.trks[0].trksegs[0].trkpts[0].time ?? DateTime(0);
    Duration duration = last.difference(first);
    //output format HH:MM:SS
    
    return '${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }
  
  static double getDistance(Gpx gpx){
    double distance = 0.0;
    for (int i=0; i < gpx.trks[0].trksegs[0].trkpts.length - 1; i++) {
      LatLng x = LatLng(gpx.trks[0].trksegs[0].trkpts[i].lat!, gpx.trks[0].trksegs[0].trkpts[i].lon!);
      LatLng y = LatLng(gpx.trks[0].trksegs[0].trkpts[i+1].lat!, gpx.trks[0].trksegs[0].trkpts[i+1].lon!);
      distance += _haversine(x, y);
    }
    return distance;
  }

  static double _haversine(LatLng x, LatLng y){
    double dLat = (y.latitude - x.latitude) * pi/180.0;
    double dLon = (y.longitude - x.longitude) * pi/180.0;

    // convert to radians
    double lat1 = (x.latitude) * pi / 180.0;
    double lat2= (y.latitude) * pi / 180.0;

    // apply formulae
    double a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(lat1) * cos(lat2);
    double rad = 6371;
    double c = 2 * asin(sqrt(a));
    return rad * c;
  }
}