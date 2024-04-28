import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:traqer/Views/live_data.dart';
import '../Controllers/location_controller.dart';
import '../Utils/Theme/theme.dart';
import '../Utils/Theme/theme_provider.dart';
import '../Views/Widgets/start_stop_button.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class Map extends StatefulWidget {

  const Map({super.key});

  @override
  State<Map> createState() => _MapState();

}

class _MapState extends State<Map> {

  late bool _navigationMode;
  late int _pointerCount;
  late AlignOnUpdate _alignOnUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;
  late StreamController<void> _turnHeadingUpStreamController;

  Widget _tileBuilder(BuildContext context, Widget tileWidget, TileImage tile) {
    ColorFiltered dark = ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
        0,       0,       0,       1, 0,   // Alpha channel
      ]),
      child: tileWidget,
    );
    ColorFiltered light = ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        1, 0, 0, 0, 0, // Red channel
        0, 1, 0, 0, 0, // Green channel
        0, 0, 1, 0, 0, // Blue channel
        0, 0, 0, 1, 0,   // Alpha channel
      ]),
      child: tileWidget,
    );
    return Provider.of<ThemeProvider>(context).themeData == lightMode ? light : dark;
  }

  @override
  void initState() {
    super.initState();
    _navigationMode = false;
    _pointerCount = 0;
    _alignOnUpdate = AlignOnUpdate.never;
    _followCurrentLocationStreamController = StreamController<double?>();
    _turnHeadingUpStreamController = StreamController<void>();
  }

  @override
  void dispose() {
    _turnHeadingUpStreamController.close();
    _followCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child:
              Align(
                alignment: Alignment.topCenter,
                child: FlutterMap(
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
                      _alignOnUpdate = AlignOnUpdate.never;
                    }
                  }
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'uk.mielnicz.Traqer',
                    tileBuilder: _tileBuilder,
                    maxZoom: 19,
                  ),
                  CurrentLocationLayer(
                    focalPoint: const FocalPoint(ratio: Point(0.0, 1.0), offset: Point(0.0, -60.0)),
                    //followScreenPointOffset: const Point(0.0, -60.0),
                    // headingStream: LocationController.positionStream.map(
                    //         (Position pos) => LocationMarkerHeading(
                    //             heading: pos.heading,
                    //             accuracy: pos.headingAccuracy)),
                    alignPositionStream: _followCurrentLocationStreamController.stream,
                    alignDirectionStream: _turnHeadingUpStreamController.stream,
                    alignPositionOnUpdate: _alignOnUpdate,
                    alignDirectionOnUpdate: _alignOnUpdate,
                    style: const LocationMarkerStyle(
                      marker: DefaultLocationMarker(
                        child: Icon(
                          Icons.navigation,
                          color: Colors.white,
                        ),
                      ),
                      markerSize: Size.square(40.0),
                      markerDirection: MarkerDirection.heading,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FloatingActionButton(
                        backgroundColor: _navigationMode ? Theme.of(context).colorScheme.primary : Colors.grey,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          setState(
                                () {
                              _navigationMode = !_navigationMode;
                              _alignOnUpdate = _navigationMode
                                  ? AlignOnUpdate.always
                                  : AlignOnUpdate.never;
                              _alignOnUpdate = _navigationMode
                                  ? AlignOnUpdate.always
                                  : AlignOnUpdate.never;
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
              heightFactor: 6.1,
              child: StartStopButton(onPressed: () { },),
            )
          ],
        ),

    );
  }

  void _onPointerDown(e, l) {
    _pointerCount++;
    setState(() {
      _alignOnUpdate = AlignOnUpdate.never;
    });
  }

  // Enable follow and turn again when user end manipulation.
  void _onPointerUp(e, l) {
    if (--_pointerCount == 0 && _navigationMode) {
      setState(() {
        _alignOnUpdate = AlignOnUpdate.always;
      });
      _followCurrentLocationStreamController.add(18);
      _turnHeadingUpStreamController.add(null);
    }
  }
}
