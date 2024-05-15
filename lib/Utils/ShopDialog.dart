import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDialog extends StatefulWidget {
  const ShopDialog({super.key});

  @override
  State<ShopDialog> createState() => _ShopDialogState();
}

class _ShopDialogState extends State<ShopDialog>{

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
    Uri(scheme: 'https', host: 'www.bergfreunde.eu', path: '/'); //przykładowy adres sklepu
    return AlertDialog(
        title: const Text("Hey it's your favourite sports shop"),
        content: const Text("Maybe would you like take a look at our selection of sports and outdoor equipment?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Maybe later...'),
          ),
          TextButton(
            onPressed: () => _launchInWebView(toLaunch),
            child: const Text('Yes! Take me there!'),
          ),
        ],
      );
  }
}
