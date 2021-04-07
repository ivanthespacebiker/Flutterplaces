/// Экран со списком интересных мест

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "./sight_card.dart";
import "../../mocks.dart";

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
            child: Container(
              child: Text(
                'Список \nинтересных мест',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(59,62,91,1),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  height: 1.12,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SightCard(
              mocks[0],
            ),
          ],
        ),
      ),
    );
  }
}
