import 'dart:io';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';

class TrackReader{

  static Future<List<Wpt>> _read(String path) async {
    //TODO: validate path
    File trackFile = File(path);

    //TODO: validate .gpx
    String track = await trackFile.readAsString();
    print(track);
    Gpx gpx = GpxReader().fromString(await trackFile.readAsString());
    return gpx.trks[0].trksegs[0].trkpts;
  }

  //List of points (Lat, Long) is needed to draw Polyline object on the map wpts => (Lat, Lng)
  static List<LatLng> _wptsToPoints(List<Wpt> wpts){
    List<LatLng> points = [];
    for (var element in wpts) {
      points.add(LatLng(element.lat!, element.lon!));
    }
    return points;
  }

  static Future<List<LatLng>> getPoints(String path) async{
    List<Wpt> wpts = await _read(path);
    print(_wptsToPoints(wpts));
    return _wptsToPoints(wpts);
  }
}