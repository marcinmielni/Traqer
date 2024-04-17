import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:traqer/Controllers/location_controller.dart';
import 'package:traqer/Models/Decorators/track_decorator.dart';
import 'package:traqer/Views/Widgets/meter.dart';
import '../Views/Widgets/start_stop_button.dart';

class LiveData extends StatefulWidget {

  LiveData({Key? key})
      : super(key: key);

  @override
  State<LiveData> createState() => _LiveDataState();
}
class _LiveDataState extends State<LiveData> with AutomaticKeepAliveClientMixin<LiveData> {

  late double speed;
  Position? previousPosition = LocationController.position;
  Position? currentPosition = LocationController.position;
  double distance = 0.0;
  late DateTime startTime;
  Duration time = const Duration();
  StreamSubscription<Position>? streamSubscription;
  Timer? timer;

  void start() async {
    currentPosition = await Geolocator.getCurrentPosition();
    startTime = DateTime.now();
    streamSubscription = LocationController.positionStream.listen((position){
      setState(() {
        previousPosition = currentPosition;
        currentPosition = position;
        distance += TrackDecorator.haversine(LatLng(previousPosition!.latitude, previousPosition!.longitude), LatLng(currentPosition!.latitude, currentPosition!.longitude));
      });
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time += const Duration(seconds: 1);
      });
    });
  }

  void stop(){
    streamSubscription?.cancel();
    streamSubscription = null;
    timer?.cancel();
    timer = null;
    setState(() {
      distance = 0.0;
      time = const Duration();
    });

  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    speed = (LocationController.position == null ? -1 : LocationController.position?.speed)!;
    LocationController.positionStream.listen((position){
      setState(() {
        speed = position.speed * 3.6;
      });
      print(position.speed);
    });
    // timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
    //   setState(() {
    //     speed = (LocationController.position!.speed) * 1.61;
    //   });
    // });
  }

  @override
  void dispose(){
    speed = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Training"),
        // ),
        backgroundColor: const Color(0xFF56358B),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Meter('Speed', "${speed.toStringAsFixed(2)} km/h", false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Meter('Distance', '${distance.toStringAsFixed(3)} km', false),
                    Meter('Time', "${time.inHours.toString().padLeft(2, '0')}:${(time.inMinutes % 60).toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}", false),
                  ],
              ),
              Center(
                heightFactor: 0.4,
                  child: StartStopButton(onPressed: () {
                    if(streamSubscription == null){
                      start();
                      print("Distance started");
                    }else{
                      stop();
                      print("Distance stopped");
                    }
              },)),
            ],
        )
    )
    );
  }
}