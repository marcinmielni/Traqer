import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_settings/open_settings.dart';

class DialogBuilder{
  static Future<void> build(BuildContext context, dynamic e, String message, Function function) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              e.toString()
          ),
          content: Text(
            message
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Change settings'),
              onPressed: () {
                function;
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Done'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Exit App'),
              onPressed: () {
                SystemNavigator.pop();
                    ()=> exit(0);
              },
            ),
          ],
        );
      },
    );
  }
}