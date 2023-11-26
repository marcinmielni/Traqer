import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../meter.dart';

class WeekSummary extends StatefulWidget{

  const WeekSummary( {Key? key}) : super(key: key);

  @override
  State<WeekSummary> createState() => _WeekSummaryState();
}

class _WeekSummaryState extends State<WeekSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.black12,
      child: Column(
        children:[
          Meter("Time this week", 12),
          Meter("KM this week", 124),
        ]
      )
    );
  }

}