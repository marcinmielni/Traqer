import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traqer/Pages/liveData.dart';
import 'package:traqer/main.dart';

class AppSlider extends StatelessWidget{
  const AppSlider({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return PageView(
      children: [
        const MyHomePage(title: 'Touch counter'),
        const LiveData(),
        Container(color: Colors.red,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
      ],
    );
  }

}