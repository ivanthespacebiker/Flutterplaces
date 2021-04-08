import 'package:flutter/material.dart';
import 'package:places/ui/screen/SightDetails.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'mocks.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My title',
      //home: SightListScreen(),
      home: SightDetails(mocks[0]),
    );
  }
}
