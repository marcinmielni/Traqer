import 'package:flutter/material.dart';
import 'package:traqer/app_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traqer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AppSlider()/*Scaffold(
          body: ListView(
            scrollDirection: Axis.horizontal,
            addAutomaticKeepAlives: false,
            children: [
              Container(
                  color: Colors.red,
                  height: 500,
                  width: 500,
              ),
              Container(
                color: Colors.green,
                height: 500,
                width: 500,
              ),
              Container(
                color: Colors.blue,
                height: 500,
                width: 500,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
    ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
    ),
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize),
              label: 'Summary',
    )
    ],
      ),
      ),*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
