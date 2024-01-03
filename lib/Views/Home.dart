import 'package:flutter/material.dart';
import 'package:traqer/Widgets/menu.dart';
import 'package:traqer/Widgets/week_summary.dart';
import 'liveData.dart';
import 'map.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.cyanAccent,
        floatingActionButton: const Menu(),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            IconButton(
              icon: const Icon(Icons.play_arrow, size: 120,),
              color: Colors.green,
              onPressed: () {
                /*Map<Permission, PermissionStatus> statuses = await [
                  Permission.location,
                  Permission.locationAlways,
                ].request();*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      PageView(
                        children: [
                          const LiveData(),
                          //const LocationApp(),
                          Map(),
                        ],
                      )
                  ),
                );
              },
            ),
             const WeekSummary(),
        ])
      );
  }
}