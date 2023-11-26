import 'package:flutter/material.dart';
import 'package:traqer/meter.dart';

class LiveData extends StatelessWidget{

  const LiveData({Key? key}) : super(key:key);

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

            ],
        )
    )
    );
  }


}