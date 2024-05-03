import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:traqer/Views/training_analysis.dart';


class MyActivities extends StatefulWidget {

  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {

  final List<double> colorOpacity = <double>[0.125, 0.25];
  late String directory;
  List<FileSystemEntity> items = [];
  @override
  void initState() {
    super.initState();
    _listOfFiles();
  }

  void _listOfFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      items = Directory(directory).listSync();
      items = items.where((i) => i.path.toString().endsWith('.gpx')).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My activities"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 50,
            color: Theme.of(context).primaryColor.withOpacity(colorOpacity[index%2]),
            child: Align(
              alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                      child: Text('${index+1}. ${items[index].path.split('/').last}', textWidthBasis: TextWidthBasis.parent, style: Theme.of(context).textTheme.bodySmall),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                          TrainingAnalysis(path: items[index].path),
                        ),
                    );
                  },
                ),
            ),
          );
        }
      ),
    );
  }
}