import 'package:flutter/material.dart';
import 'package:traqer/Pages/liveData.dart';
import 'package:traqer/Pages/meter.dart';

class LiveData extends StatelessWidget{

  const LiveData({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
    );
  }


}