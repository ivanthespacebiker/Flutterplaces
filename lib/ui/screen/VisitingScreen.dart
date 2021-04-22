import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:places/ui/style/default.dart';
import 'package:places/ui/style/picturesAssets.dart';

/// Экран "Хочу посетить/Посещенные места"
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _VisitingScreenAppBar(),
        body: TabBarView(children: [
          _VisitingScreenWantToVisitList(),
          _VisitingScreenVisitedList(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: BNB_SelectedItemColor,
          unselectedItemColor: BNB_UnselectedItemColor,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(BNB_List)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(BNB_Map)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(BNB_Heart)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(BNB_Settings)),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class _VisitingScreenWantToVisitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("tab 1"),
    );
  }
}

class _VisitingScreenVisitedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("tab 2"),
    );
  }
}

class _VisitingScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  _VisitingScreenAppBar({
    Key key,
  }) : super(key: key);
  static const double appBarHeight = 108.0;
  final Size _preferredSize = Size.fromHeight(appBarHeight);
  @override
  Size get preferredSize => _preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: backgroundColor,
      flexibleSpace: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            constraints: BoxConstraints(
              minHeight: 80,
              maxHeight: 80,
              minWidth: double.infinity,
            ),
            padding: EdgeInsets.only(
              top: 24,
              //bottom: 16,
              left: defaultEdgeInsets,
              right: defaultEdgeInsets,
            ),
            margin: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: 56,
                minWidth: double.infinity,
              ),
              child: Text(
                'Избранное',
                textAlign: TextAlign.center,
                style: visitingScreenAppBarTextStyle,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 52,
              maxHeight: 52,
              minWidth: double.infinity,
            ),
            //color: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              margin: EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: defaultEdgeInsets,
                  right: defaultEdgeInsets),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 62, 91, 1),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    // margin: EdgeInsets.only(
                    //     top: 6, bottom: 6, left: defaultEdgeInsets),
                    constraints: BoxConstraints(
                      minHeight: 40,
                      maxHeight: 40,
                      minWidth: 164,
                    ),
                    child: Center(child: Text("Хочу посетить")),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 62, 91, 1),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    // margin: EdgeInsets.only(
                    //     top: 6, bottom: 6, right: defaultEdgeInsets),
                    constraints: BoxConstraints(
                      minHeight: 40,
                      maxHeight: 40,
                      minWidth: 164,
                    ),
                    child: Center(child: Text("Посетил")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
