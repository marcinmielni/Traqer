import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:traqer/Widgets/meter.dart';

import '../Controllers/location_controller.dart';

class TrainingAnalysis extends StatefulWidget {

  const TrainingAnalysis({super.key});

  @override
  State<StatefulWidget> createState() => _TrainingAnalysisState();

}

class _TrainingAnalysisState extends State<TrainingAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF56358B),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                initialCenter: LatLng(LocationController.position!.latitude, LocationController.position!.longitude),
                initialZoom: 7,
                minZoom: 0,
                maxZoom: 19,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'uk.mielnicz.Traqer',
                  maxZoom: 19,
                ),
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