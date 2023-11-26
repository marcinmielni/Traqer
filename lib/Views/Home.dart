import 'package:flutter/material.dart';
import 'package:traqer/Views/menu.dart';
import 'package:traqer/Views/week_summary.dart';
import 'dart:io';
import 'dart:async';
import '../Builders/dialog_builder.dart';
import '../permissions.dart';
import 'package:permission_handler/permission_handler.dart';
import '../meter.dart';
import 'LocationApp.dart';
import 'liveData.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.cyanAccent,
        floatingActionButton: Menu(),
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
                        children: const [
                          LiveData(),
                          LocationApp(),
                        ],
                      )),
                );
              },
            ),
             const WeekSummary(),
        ])
      );
  }
}