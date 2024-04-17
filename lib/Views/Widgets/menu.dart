import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:traqer/Views/my_activities.dart';
import 'package:traqer/Views/training_analysis.dart';
import 'package:traqer/Views/about.dart';



class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: const Color(0xFFD9D9D9),
      buttonSize: const Size(60,60),
      childrenButtonSize: const Size(60, 60),
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.settings),
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
          child: const Icon(Icons.abc),
          label: "About...",
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                const About()
              )
            );
          }
        ),
        // SpeedDialChild(
        //     child: const Icon(Icons.bar_chart),
        //     label: "Training Analysis",
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) =>
        //           const TrainingAnalysis()
        //           )
        //       );
        //     }
        // ),

      ],
    );
  }
}