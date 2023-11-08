import 'package:flutter/material.dart';
import 'package:traqer/liveData.dart';
import 'package:traqer/main.dart';
import 'package:traqer/Views/Home.dart';
import 'package:traqer/Views/LiveMap.dart';
import 'package:traqer/Views/Archive.dart';
import 'package:traqer/Views/LocationApp.dart';

class AppSlider extends StatelessWidget{
  const AppSlider({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return PageView(
      children: [
        Home(),
        LiveData(),
        LiveMap(),
        Archive(),
        LocationApp(),
      ],
    );
  }

}