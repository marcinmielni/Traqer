import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class MyActivities extends StatefulWidget {

  MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {

  final List<int> colorCodes = <int>[200, 100];
  late String directory;
  List items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listofFiles();
  }

  // Make New Function
  void _listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      items = Directory("$directory").listSync();  //use your folder name insted of resume.
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My activities"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 50,
            color: Colors.green[colorCodes[index%2]],
            child: Center(
                child: Text('$index ${items[index]}')
            )
          );
        }
      ),
    );
  }
}