import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/style/default.dart';
import 'package:places/ui/style/picturesAssets.dart';
import '../../mocks.dart';

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
          selectedItemColor: bnbSelectedItemColor,
          unselectedItemColor: bnbUnselectedItemColor,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(bnbList)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(bnbMap)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(bnbHeart)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(bnbSettings)),
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
    return Column(children: [
      _VisitingScreenTabBar(
        selectedItem: 0,
      ),
      Column(
        children: [
          SightCardWantToVizit(
            sight: mocks[0],
          ),
          SightCardWantToVizit(
            sight: mocks[1],
          ),
        ],
      ),
    ]);
  }
}

class _VisitingScreenVisitedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _VisitingScreenTabBar(
        selectedItem: 1,
      ),
      Column(
        children: [
          SightCardVizited(
            sight: mocks[2],
          ),
        ],
      ),
    ]);
  }
}

class _VisitingScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  _VisitingScreenAppBar({
    Key key,
  }) : super(key: key);
  static const double appBarHeight = 56.0;
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
          //_VisitingScreenTabBar(),
        ],
      ),
    );
  }
}

class _VisitingScreenTabBar extends StatelessWidget {
  final int _selectedItem;
  const _VisitingScreenTabBar({
    Key key,
    @required int selectedItem,
  })  : _selectedItem = selectedItem,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List tabsLabels = [
      "Хочу посетить",
      "Посетил",
    ];
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        maxHeight: 52,
        minWidth: double.infinity,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: tabBarBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        margin: EdgeInsets.only(
            top: 6,
            bottom: 6,
            left: defaultEdgeInsets,
            right: defaultEdgeInsets),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < tabsLabels.length; i++)
              _visitingScreenTabBarItem(
                label: tabsLabels[i],
                selected: (i == _selectedItem),
              )
          ],
        ),
      ),
    );
  }

  Expanded _visitingScreenTabBarItem(
      {@required String label, @required bool selected}) {
    Color backgroundColor;
    TextStyle textStyle;
    if (selected) {
      backgroundColor = tabBarSelevtedItemBackgroundColor;
      textStyle = tabBarSeltctedItemTextStyle;
    } else {
      backgroundColor = tabBarUnselevtedItemBackgroundColor;
      textStyle = tabBarUnseltctedItemTextStyle;
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        constraints: BoxConstraints(
          minHeight: 40,
          maxHeight: 40,
          minWidth: 164,
          maxWidth: double.infinity,
        ),
        child: Center(
            child: Text(
          label,
          style: textStyle,
        )),
      ),
    );
  }
}
