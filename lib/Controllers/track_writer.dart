import 'dart:io';
import 'package:gpx/gpx.dart';
import 'package:path_provider/path_provider.dart';


class TrackWriter{
  static late Trkseg currentSeg;
  static late Trk currentTrack;
  static late Gpx gpx;
  static late GpxWriter gpxWriter;
  Wpt waypoint = Wpt();

  static initGpx(){
    gpx = Gpx();
    gpx.creator = 'TraqerApp';
    gpx.metadata = Metadata();
    gpx.metadata?.name = DateTime.now().toString();
    gpx.metadata?.desc = 'Training data';
    gpx.metadata?.time = DateTime.now();
    //gpx.metadata?.extensions TODO: figure out if speed extension is needed
    gpx.trks = [];
    initSegment();
    initTrack();
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static initTrack(){
    currentTrack = Trk(name: 'Training',desc: "Created with TraqerApp",src: 'Location engine', number: 1);
  }

  static initSegment(){
    currentSeg = Trkseg();
  }

  static addTrackPoint(Wpt trkPoint){
    currentSeg.trkpts.add(trkPoint);
  }


  static Future<void> saveGpx() async {
    currentTrack.trksegs.add(currentSeg);
    gpx.trks.add(currentTrack);

    String path = await _localPath;
    print("got local path $path");

    File gpxFile = File('$path/${gpx.metadata?.name}.gpx');
    print("created file $path/${gpx.metadata?.name}.gpx");

    String gpxString = GpxWriter().asString(gpx, pretty: true);
    gpxFile.writeAsString(gpxString);
    print('gpx saved');
  }

}