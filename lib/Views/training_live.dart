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
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                bottom: TabBar(
                    indicatorColor: Theme.of(context).indicatorColor,
                    labelColor: Theme.of(context).indicatorColor,
                    unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.5),
                    tabs: const <Widget>[
                      Tab(text: 'Meters'),
                      Tab(text: 'Map'),
                    ]
                )
            ),
            body: TabBarView(
              children: [
                LiveData(),
                const Map(),
              ],
            )
        ));
  }

}