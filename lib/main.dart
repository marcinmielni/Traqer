import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'permissions.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Permissions.requestRequiredPermissions();
  //await LocationController.getPosition();
  runApp(const Traqer());
}

class Traqer extends StatefulWidget {

  const Traqer({Key? key}) : super(key: key);
  
  @override
  State<Traqer> createState() => _TraqerState();
}

class _TraqerState extends State<Traqer> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traqer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // textTheme:
      ),
      home: const Home(),
    );
  }
}

