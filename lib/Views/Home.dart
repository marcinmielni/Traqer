import 'package:flutter/material.dart';
import 'package:traqer/Views/Widgets/menu.dart';
import 'package:traqer/Views/Widgets/meter.dart';
import 'live_data.dart';
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
        backgroundColor: const Color(0xFF56358B),
        floatingActionButton: const Menu(),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: const Color(0xFF56358B)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.play_arrow, size: 200, color: Colors.green),
                  Text("Start training!", style: TextStyle(fontSize: 40, color: Colors.green)),
                ],),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      DefaultTabController(
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
                      ))
                  ),
                );
              },
            ),
              Container(height: 100),
              SizedBox(
                height: 300,
                width: 350,
                child: Column(
                  children: <Widget>[
                    Meter("Time this week", '12', false),
                    Container(height: 60),
                    Meter("KM this week", '124', false),
                  ]
                ),
              )
        ])
      );
  }
}