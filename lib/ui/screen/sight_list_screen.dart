import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/style/default.dart';
import '../../mocks.dart';

/// Экран со списком интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: SightListAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SightCard(
                sight: mocks[0],
              ),
              SightCardWantToVizit(
                sight: mocks[1],
              ),
              SightCardVizited(
                sight: mocks[2],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SightListAppBar extends PreferredSize {
  static const double appBarHeight = 136.0;
  final Size _preferredSize = Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: backgroundColor,
      flexibleSpace: Container(
        padding: EdgeInsets.only(
          top: 64,
          bottom: 0,
          left: defaultEdgeInsets,
          right: defaultEdgeInsets,
        ),
        margin: EdgeInsets.zero,
        child: Container(
          child: Text(
            'Список \nинтересных мест',
            textAlign: TextAlign.left,
            style: appBarTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => _preferredSize;
}
