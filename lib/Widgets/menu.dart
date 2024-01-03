import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:traqer/Views/my_activities.dart';
import '../Views/about.dart';



class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      buttonSize: const Size(80,80),
      childrenButtonSize: const Size(80, 80),
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: Icon(Icons.settings),
          label: "Settings",
        ),
        SpeedDialChild(
          child: const Icon(Icons.book),
          label: "My activities",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  MyActivities()
                  )
              );
            }
        ),
        SpeedDialChild(
          child: Icon(Icons.abc),
          label: "About...",
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                const About()
              )
            );
          }
        ),

      ],
    );
  }
}