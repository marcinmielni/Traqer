import 'package:flutter/material.dart';
import 'package:traqer/Widgets/meter.dart';
import '../Widgets/start_stop_button.dart';

class LiveData extends StatefulWidget {

  const LiveData({Key? key})
      : super(key: key);

  @override
  State<LiveData> createState() => _LiveDataState();
}
class _LiveDataState extends State<LiveData> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Training"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const[
                  Meter('Speed', 15),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Meter('Speed', 15),
                    Meter('Speed', 15),
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Meter('Speed', 15),
                    Meter('Speed', 15),
                  ],
              ),
              Center(child: StartStopButton()),
            ],
        )
    )
    );
  }


}