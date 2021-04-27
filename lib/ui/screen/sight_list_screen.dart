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
      appBar: _SightListAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < mocks.length; i++)
                SightCard(
                  sight: mocks[i],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SightListAppBar extends StatelessWidget implements PreferredSizeWidget {
  _SightListAppBar({
    Key key,
  }) : super(key: key);
  static const double appBarHeight = 112.0;
  final Size _preferredSize = Size.fromHeight(appBarHeight);
  @override
  Size get preferredSize => _preferredSize;

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
            style: sightListAppBarTextStyle,
          ),
        ),
      ),
    );
  }
}
