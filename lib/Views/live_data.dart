import 'dart:async';
import 'package:flutter/material.dart';
import 'package:traqer/Controllers/location_controller.dart';
import 'package:traqer/Views/Widgets/meter.dart';
import '../Views/Widgets/start_stop_button.dart';

class LiveData extends StatefulWidget {

  const LiveData({Key? key})
      : super(key: key);

  @override
  State<LiveData> createState() => _LiveDataState();
}
class _LiveDataState extends State<LiveData> {

  late double speed;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    speed = (LocationController.position == null ? -1 : LocationController.position?.speed)!;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        speed = (LocationController.position!.speed) * 1.61;
      });
    });
  }

  @override
  void dispose(){
    timer.cancel();
    speed = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Training"),
        // ),
        backgroundColor: const Color(0xFF56358B),
        body: Container(
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Meter('Distance', '15', false),
                    Meter('Time', '15', false),
                  ],
              ),
              Center(child: StartStopButton()),
            ],
        )
    )
    );
  }


}