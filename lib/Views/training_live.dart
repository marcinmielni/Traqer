import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'map.dart';
import 'live_data.dart';

class TrainingLive extends StatefulWidget{

  const TrainingLive({Key? key}) : super(key: key);

  @override
  State<TrainingLive> createState() => _TrainingLiveState();

}

class _TrainingLiveState extends State<TrainingLive> {

  @override
  void dispose(){
    super.dispose();
    print("Training live closed"); //TODO: remove
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xFF56358B),
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                bottom: const TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xFF6C47A8),
                    tabs: <Widget>[
                      Tab(text: 'Meters'),
                      Tab(text: 'Map'),
                    ]
                )
            ),
            body: const TabBarView(
              children: [
                LiveData(),
                Map(),
              ],
            )
        ));
  }

}