import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MySecondWidjet(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  int _callBuildCounter = 0;
  @override
  Widget build(BuildContext context) {
    _callBuildCounter += 1;
    print('build count: $_callBuildCounter');
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}

class MySecondWidjet extends StatefulWidget {
  @override
  _MySecondWidjetState createState() => _MySecondWidjetState();
}

class _MySecondWidjetState extends State<MySecondWidjet> {
  int _callBuildCounter = 0;
  @override
  Widget build(BuildContext context) {
    _callBuildCounter += 1;
    print('build count: $_callBuildCounter');
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}
