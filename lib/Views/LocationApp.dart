import 'dart:async';
import '../Controllers/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationApp extends StatefulWidget {

  const LocationApp(StreamSubscription<Position> streamSubscription, {Key? key}) : super(key: key);

  static get streamSubscription => streamSubscription;

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                      Icons.location_on,
                      size: 46.0,
                      color: Colors.blue
                  ),
                  const SizedBox(
                      height: 10.0
                  ),
                  const Text(
                    "Get user Location",
                    style: TextStyle(
                        fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text("Position: yoink!"),
                  TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green)
                    ),
                    onPressed: () {
                      if (LocationApp.streamSubscription.isPaused) {
                        LocationApp.streamSubscription.resume();
                      }
                    },
                    child: const Text("Start training",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)
                    ),
                    onPressed: () {
                      LocationApp.streamSubscription.pause();
                    },
                    child: const Text("Stop training",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  )
                ],
              )
          )
      );
    }
  }
