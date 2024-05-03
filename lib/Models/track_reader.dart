import 'dart:io';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';

class TrackReader{

  static Future<Gpx> read(String path) async {

    File trackFile = File(path);

    String track = await trackFile.readAsString();
    Gpx gpx = GpxReader().fromString(await trackFile.readAsString());
    return gpx;
  }

  static Future<List<FileSystemEntity>> getGpxList() async {
    String directory = (await getApplicationDocumentsDirectory()).path;
    List<FileSystemEntity> items = [];
    items = Directory(directory).listSync();
    items = items.where((i) => i.path.toString().endsWith('.gpx')).toList();
    return items;
  }

  static List<Wpt> gpxToWpt(Gpx gpx){
    return gpx.trks[0].trksegs[0].trkpts;
  }

  static List<LatLng> _wptsToPoints(List<Wpt> wpts){
    List<LatLng> points = [];
    for (var element in wpts) {
      points.add(LatLng(element.lat!, element.lon!));
    }
    return points;
  }

  static Future<List<LatLng>> getPoints(String path) async{
    List<Wpt> wpts = gpxToWpt(await read(path));
    return _wptsToPoints(wpts);
  }
}