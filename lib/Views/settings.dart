import 'package:flutter/material.dart';
import 'package:traqer/Utils/Theme/theme_provider.dart';
import 'package:provider/provider.dart';


class Settings extends StatefulWidget {

  const Settings({Key? key})
      : super(key: key);

  static int locationAccuracy = 0;
  static bool darkMode = false;
  static ThemeMode mode = ThemeMode.light;

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {

  //var darkMode = false;
  var gpsAccuracy = 1;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        title: const Text("Settings"),
      ),
        // backgroundColor: const Color(0xFF56358B),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Dark theme", style: Theme.of(context).textTheme.bodyLarge,),
                Switch(
                    value: Settings.darkMode,
                    onChanged: (bool value) {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      setState(() {
                        Settings.darkMode = value;
                      });
                    }
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Gps accuracy", style: Theme.of(context).textTheme.bodyLarge,),
                DropdownButton(
                    value: gpsAccuracy,
                    items: const [
                      DropdownMenuItem(value: 1,child: Text("1"),),
                      DropdownMenuItem(value: 5, child: Text("5")),
                      DropdownMenuItem(value: 15, child: Text("15")),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        gpsAccuracy = value!;
                      });
                    }
                ),
              ],
            ),
          ]
        )
    );
  }
}