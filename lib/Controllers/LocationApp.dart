import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationApp extends StatefulWidget {

  const LocationApp({Key? key}) : super(key:key);

  @override
  State<LocationApp> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {





  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Location Services"),

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              size:46.0,
              color: Colors.blue
            ),
            const SizedBox(
              height: 10.0
            ),
            const Text(
              "Get user Location",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Position: $locationMessage"),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)
              ),
              onPressed: () {
                if(subscription.isPaused) {
                  subscription.resume();
                }else{
                  subscription.pause();
                }
              },
              child: const Text("Get current Location",
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