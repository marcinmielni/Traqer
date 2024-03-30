import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:traqer/Controllers/track_reader.dart';
import 'package:traqer/Views/Widgets/meter.dart';

import '../Controllers/location_controller.dart';

class TrainingAnalysis extends StatefulWidget {

  const TrainingAnalysis({super.key, required this.path});

  final String path;

  @override
  State<StatefulWidget> createState() => _TrainingAnalysisState();

}

class _TrainingAnalysisState extends State<TrainingAnalysis> {

  late List<LatLng> points;

  Future<List<LatLng>> _getPoints() async {
    return await TrackReader.getPoints(widget.path);
  }

  @override
  void initState(){
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
        //automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF3F1C77),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        title: const Text("Training Analysis"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 400,
            //width: 400,
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
          Row(
            children: [
              Meter('Distance', '23.2', false),
              Meter('Time', '1:12:15', false),
              Meter('Avg. Speed', '25.4 km/h', false),
            ]
          )
        ],
      )
    );

  }

}