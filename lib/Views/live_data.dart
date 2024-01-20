import 'dart:async';
import 'package:flutter/material.dart';
import 'package:traqer/Controllers/location_controller.dart';
import 'package:traqer/Widgets/meter.dart';
import '../Widgets/start_stop_button.dart';

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
    speed = (LocationController.position == null ? 0 : LocationController.position?.speed)!;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        speed = LocationController.position!.speed;
      });
    });
    super.initState();
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
                  Meter('Speed', speed.toStringAsFixed(2), true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Meter('Speed', '15', false),
                    Meter('Speed', '15', false),
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Meter('Speed', '15', false),
                    Meter('Speed', '15', false),
                  ],
              ),
              Center(child: StartStopButton()),
            ],
        )
    )
    );
  }


}