import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:traqer/Views/my_activities.dart';
import 'package:traqer/Views/about.dart';
import '../../Utils/ShopDialog.dart';
import '../settings.dart';




class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  void _showDialog(){
    setState(() {
      showDialog(context: context, builder: (BuildContext context) => const ShopDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      buttonSize: const Size(60,60),
      childrenButtonSize: const Size(60, 60),
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          labelStyle: Theme.of(context).textTheme.bodySmall,
          child: const Icon(Icons.settings),
          label: "Settings",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    const Settings()
                )
            );
          }
        ),
        SpeedDialChild(
            labelStyle: Theme.of(context).textTheme.bodySmall,
          child: const Icon(Icons.book),
          label: "My activities",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  const MyActivities()
                  )
              );
            }
        ),
        SpeedDialChild(
            labelStyle: Theme.of(context).textTheme.bodySmall,
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
        SpeedDialChild(
            labelStyle: Theme.of(context).textTheme.bodySmall,
            child: const Icon(Icons.shopping_bag),
            label: "Shop",
            onTap: () {
              _showDialog();
            }
        ),
      ],
    );
  }
}