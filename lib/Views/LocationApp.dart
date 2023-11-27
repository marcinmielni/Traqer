import 'dart:async';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Controllers/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../animated_button.dart';

class LocationApp extends StatefulWidget {

  const LocationApp({Key? key}) : super(key: key);


  @override
  State<LocationApp> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {

    @override
    Widget build(BuildContext context) {

      //subscription.pause();

      return Scaffold(
          appBar: AppBar(
            title: const Text("Location Services"),

          ),
          body: Center(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    color: Colors.pinkAccent,
                    child: const Center(
                      child: Text("MAPA"),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("Position: yoink!"),
                  const Center(child: AnimatedButton()),
                ],
              )
          )
      );
    }
  }
