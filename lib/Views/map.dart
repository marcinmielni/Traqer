import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../Controllers/location_controller.dart';
import '../Widgets/start_stop_button.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class Map extends StatefulWidget {

  const Map({super.key});

  @override
  State<Map> createState() => _MapState();

}

class _MapState extends State<Map> {

  late bool _navigationMode;
  late int _pointerCount;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late TurnOnHeadingUpdate _turnOnHeadingUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;
  late StreamController<void> _turnHeadingUpStreamController;

  @override
  void initState() {
    super.initState();
    _navigationMode = false;
    _pointerCount = 0;
    _followOnLocationUpdate = FollowOnLocationUpdate.never;
    _turnOnHeadingUpdate = TurnOnHeadingUpdate.never;
    _followCurrentLocationStreamController = StreamController<double?>();
    _turnHeadingUpStreamController = StreamController<void>();
  }

  @override
  void dispose() {
    _followCurrentLocationStreamController.close();
    _turnHeadingUpStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Map"),
      // ),
      backgroundColor: const Color(0xFF56358B),
        body: Stack(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              height: 530,
              child:
              Align(
                alignment: Alignment.topCenter,
                child: FlutterMap(
                  //mapController: MapController(),
                options: MapOptions(
                  initialCenter: LatLng(LocationController.position!.latitude, LocationController.position!.longitude),
                  initialZoom: 13,
                  minZoom: 0,
                  maxZoom: 19,
                  onPointerDown: _onPointerDown,
                  onPointerUp: _onPointerUp,
                  onPointerCancel: _onPointerUp,
                  onMapEvent: (evn) {
                    if(evn is MapEventMoveStart){
                      _navigationMode = false;
                      _turnOnHeadingUpdate = TurnOnHeadingUpdate.never;
                      _followOnLocationUpdate = FollowOnLocationUpdate.never;
                    }
                  }
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'uk.mielnicz.Traqer',
                    maxZoom: 19,
                  ),
                  CurrentLocationLayer(
                    followScreenPoint: const Point(0.0, 1.0),
                    followScreenPointOffset: const Point(0.0, -60.0),
                    followCurrentLocationStream: _followCurrentLocationStreamController.stream,
                    turnHeadingUpLocationStream: _turnHeadingUpStreamController.stream,
                    followOnLocationUpdate: _followOnLocationUpdate,
                    turnOnHeadingUpdate: _turnOnHeadingUpdate,
                    style: const LocationMarkerStyle(
                      marker: DefaultLocationMarker(
                        child: Icon(
                          Icons.navigation,
                          color: Colors.white,
                        ),
                      ),
                      markerSize: Size(40, 40),
                      markerDirection: MarkerDirection.heading,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FloatingActionButton(
                        backgroundColor: _navigationMode ? Colors.blue : Colors.grey,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          setState(
                                () {
                              _navigationMode = !_navigationMode;
                              _followOnLocationUpdate = _navigationMode
                                  ? FollowOnLocationUpdate.always
                                  : FollowOnLocationUpdate.never;
                              _turnOnHeadingUpdate = _navigationMode
                                  ? TurnOnHeadingUpdate.always
                                  : TurnOnHeadingUpdate.never;
                            },
                          );
                          if (_navigationMode) {
                            _followCurrentLocationStreamController.add(18);
                            _turnHeadingUpStreamController.add(null);
                          }
                        },
                        child: const Icon(
                          Icons.navigation_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),)
            ),
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 7.3,
              child: StartStopButton(),
            )
          ],
        ),

    );
  }

  void _onPointerDown(e, l) {
    _pointerCount++;
    setState(() {
      _followOnLocationUpdate = FollowOnLocationUpdate.never;
      _turnOnHeadingUpdate = TurnOnHeadingUpdate.never;
    });
  }

  // Enable follow and turn again when user end manipulation.
  void _onPointerUp(e, l) {
    if (--_pointerCount == 0 && _navigationMode) {
      setState(() {
        _followOnLocationUpdate = FollowOnLocationUpdate.always;
        _turnOnHeadingUpdate = TurnOnHeadingUpdate.always;
      });
      _followCurrentLocationStreamController.add(18);
      _turnHeadingUpStreamController.add(null);
    }
  }
}

