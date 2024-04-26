import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traqer/Utils/Theme/theme_provider.dart';
import 'Controllers/location_controller.dart';
import 'Views/home.dart';
import 'Views/settings.dart';
import 'permissions.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Permissions.requestRequiredPermissions();
  await LocationController.getPosition();
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const Traqer(),
  ));
}

class Traqer extends StatefulWidget {

  const Traqer({Key? key}) : super(key: key);

  //ThemeMode mode = Settings.mode;
  
  @override
  State<Traqer> createState() => _TraqerState();
}

class _TraqerState extends State<Traqer> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traqer',
      themeMode: Settings.mode,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const Home(),
    );
  }
}

