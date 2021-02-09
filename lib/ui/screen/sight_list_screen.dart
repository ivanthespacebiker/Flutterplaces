/// Экран со списком интересных мест

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(136.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 64, bottom: 0, left: 16, right: 16),
            margin: EdgeInsets.zero,
            // child: Container(
            //   child: Text(
            //     'Список \nинтересных мест',
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 32,
            //       fontWeight: FontWeight.bold,
            //       fontStyle: FontStyle.normal,
            //       height: 1.12,
            //     ),
            //   ),
            // ),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  height: 1.12,
                ),
                children: [
                  TextSpan(
                    text: "С",
                    style: TextStyle(color: Colors.green),
                  ),
                  TextSpan(
                    text: "писок\n",
                  ),
                  TextSpan(
                    text: "и",
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(
                    text: "нтересных мест",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
