import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:traqer/Models/track_reader.dart';
import 'package:traqer/Utils/Theme/theme.dart';
import 'package:traqer/Utils/Theme/theme_provider.dart';
import 'package:traqer/Views/Widgets/meter.dart';
import '../Utils/track_utils.dart';

class TrainingAnalysis extends StatefulWidget {

  const TrainingAnalysis({super.key, required this.path});

  final String path;

  @override
  State<StatefulWidget> createState() => _TrainingAnalysisState();

}

class _TrainingAnalysisState extends State<TrainingAnalysis> {
  late Gpx gpx;
  late List<LatLng> points;

  Future<Gpx> _getGpx() async {
    return await TrackReader.read(widget.path);
  }

  Future<List<LatLng>> _getPoints() async {
    return await TrackReader.getPoints(widget.path);
  }

  Widget _tileBuilder(BuildContext context, Widget tileWidget, TileImage tile) {
    ColorFiltered dark = ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255,
        -0.2126, -0.7152, -0.0722, 0, 255,
        -0.2126, -0.7152, -0.0722, 0, 255,
        0,       0,       0,       1, 0,
      ]),
      child: tileWidget,
    );
    ColorFiltered light = ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        1, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 1, 0,
      ]),
      child: tileWidget,
    );
    return Provider.of<ThemeProvider>(context).themeData == lightMode ? light : dark;
  }

  @override
  void initState(){
    _getGpx().then((value) {
      gpx = value;
    });
    _getPoints().then((value) {
      setState(() {
        points = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF56358B),
      appBar: AppBar(
        title: const Text("Training Analysis"),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.redAccent,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: points[0],
                initialZoom: 10,
                minZoom: 0,
                maxZoom: 19,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileBuilder: _tileBuilder,
                  userAgentPackageName: 'uk.mielnicz.Traqer',
                  maxZoom: 19,
                ),
                PolylineLayer(
                    polylines: [Polyline(
                        strokeWidth: 5,
                        color: Colors.deepPurple,
                        points: points,
                    )
                    ]
                ),
                MarkerLayer(markers: [
                  Marker(
                    point: points[0],
                    child: Icon(Icons.play_arrow, color: Colors.green.shade800, size: 40,),
                    width: 60,
                    height: 60,
                  ),
                  Marker(
                    point: points.last,
                    child: Icon(Icons.stop, color: Colors.red.shade800, size: 40),
                    width: 60,
                    height: 60,
                  )
                ])
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 5,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [Meter('Avg. Speed', '${(TrackUtils.getDistance(gpx)/TrackUtils.getTime(gpx).inSeconds * 3600).toStringAsFixed(2)} km/h', false)],),
                  Row(
                      children:[
                        Meter('Distance', TrackUtils.getDistance(gpx).toStringAsFixed(3), false),
                        Meter('Time', '${TrackUtils.getTime(gpx).inHours.toString().padLeft(2, '0')}:${TrackUtils.getTime(gpx).inMinutes.remainder(60).toString().padLeft(2, '0')}:${TrackUtils.getTime(gpx).inSeconds.remainder(60).toString().padLeft(2, '0')}', false),
                        //
                        ]
                  ),

                ]
            )
          )
        ],
      )
    );
  }
}