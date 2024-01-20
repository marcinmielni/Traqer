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
  List<FileSystemEntity> items = [];
  @override
  void initState() {
    super.initState();
    _listofFiles();
  }

  void _listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      items = Directory(directory).listSync();
      items = items.where((i) => i.path.toString().endsWith('.gpx')).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF56358B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F1C77),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        title: const Text("My activities"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 50,
            color: Colors.purple[colorCodes[index%2]],
            child: Align(
              alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                      child: Text('${index+1}. ${items[index].path.split('/').last}', textWidthBasis: TextWidthBasis.parent,),
                  ),
                  onPressed: () {  },
                ),
            ),
          );
        }
      ),
    );
  }
}