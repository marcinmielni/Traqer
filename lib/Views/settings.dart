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

   int gpsAccuracy = 0;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
        body: Column(
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
                      DropdownMenuItem(value: 0,child: Text("0 m"),),
                      DropdownMenuItem(value: 5, child: Text("5 m"),),
                      DropdownMenuItem(value: 25, child: Text("25 m")),
                      DropdownMenuItem(value: 100, child: Text("100m")),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        gpsAccuracy = value!;
                        Settings.locationAccuracy = value!;
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