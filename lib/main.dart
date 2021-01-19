import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My title',
      home: MyFirstWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(contextType(context));
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }

  Type contextType(BuildContext context) {
    return context.runtimeType;
  }
}

class MySecondWidjet extends StatefulWidget {
  @override
  _MySecondWidjetState createState() => _MySecondWidjetState();
}

class _MySecondWidjetState extends State<MySecondWidjet> {
  @override
  Widget build(BuildContext context) {
    print(contextType());
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }

  Type contextType() {
    return context.runtimeType;
  }
}
