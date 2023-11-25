import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import '../Builders/dialog_builder.dart';
import '../permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return
      Container(color: Colors.cyanAccent,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            IconButton(
              icon: const Icon(Icons.play_arrow, size: 80,),
              color: Colors.green,
              onPressed: () async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.location,
                  Permission.locationAlways,
                ].request();
              },
            ),
        ])
      );
  }
}