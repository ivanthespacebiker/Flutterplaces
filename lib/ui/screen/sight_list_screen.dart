import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "./sight_card.dart";
import "../../mocks.dart";
import '../style/default.dart';

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

      // В задании сказано:
      // Переверстать AppBar через наследника PreferredSizeWidget.
      // Я это понял так, что надо создать новый класс-наследник PreferredSizeWidget.
      // Однако когда я написал
      // class SightListAppBar extends PreferredSizeWidget {}
      // у меня волосы на спине зашевелились от количества методов, которые нужно заоверрейдить.
      // Да еще и смысл этих методов был для меня мягко говоря не ясен.
      // однако попробовав скопипастить то, как это делает сам PreferredSize, т.е.
      // class SightListAppBar extends StatelessWidget implements PreferredSizeWidget
      // все оказалось не так страшно.
      // А потом я и вовсе понял, что PreferredSizeWidget это абстактный класс
      // и если наследоваться как "extends PreferredSize" то должно быть все хорошо, что в итоге и подтвердилось.

      appBar: SightListAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SightCard(
                mocks[0],
              ),
              SightCard(
                mocks[1],
              ),
              SightCard(
                mocks[2],
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
