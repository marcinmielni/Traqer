import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import '../Models/track_reader.dart';

class TrackUtils{

  TrackUtils();

  static Duration getTime(Gpx gpx){
    DateTime? last = gpx.trks[0].trksegs[0].trkpts.last.time ?? DateTime(0);
    DateTime? first = gpx.trks[0].trksegs[0].trkpts[0].time ?? DateTime(0);
    if(first == null || last == null) {
      return const Duration(seconds: 0);
    }
    Duration duration = last.difference(first);
    return duration;
  }
  
  static double getDistance(Gpx gpx){
    double distance = 0.0;
    for (int i=0; i < gpx.trks[0].trksegs[0].trkpts.length - 1; i++) {
      LatLng x = LatLng(gpx.trks[0].trksegs[0].trkpts[i].lat!, gpx.trks[0].trksegs[0].trkpts[i].lon!);
      LatLng y = LatLng(gpx.trks[0].trksegs[0].trkpts[i+1].lat!, gpx.trks[0].trksegs[0].trkpts[i+1].lon!);
      distance += haversine(x, y);
    }
    return distance;
  }

  static double haversine(LatLng x, LatLng y){
    double dLat = (y.latitude - x.latitude) * pi/180.0;
    double dLon = (y.longitude - x.longitude) * pi/180.0;

    double lat1 = (x.latitude) * pi / 180.0;
    double lat2= (y.latitude) * pi / 180.0;

    double a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(lat1) * cos(lat2);
    double rad = 6371;
    double c = 2 * asin(sqrt(a));
    return rad * c;
  }

  static Future<double> getSevenDaysDistance(List<FileSystemEntity> items) async {
    items = items.where((i) =>
        DateTime.now().difference(i.statSync().changed) < const Duration(days: 7)
    ).toList();
    double distance = 0.0;
    for (var element in items) {
      distance += getDistance(await TrackReader.read(element.path));
    }
    return distance;
  }

  static Future<Duration> getSevenDaysTime(List<FileSystemEntity> items) async {
    items = items.where((i) =>
    DateTime.now().difference(i.statSync().modified) < const Duration(days: 7)
    ).toList();
    Duration time = Duration.zero;
    for (var element in items) {
      time += getTime(await TrackReader.read(element.path));
    }
    return time;
  }
}