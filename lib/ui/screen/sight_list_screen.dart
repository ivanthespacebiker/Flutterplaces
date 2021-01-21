import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  int _pressCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My app bar"),
      ),
      body: Center(
        child: Flex(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.vertical,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        color: Colors.brown,
                        child: Center(
                          child: Text('Press count: $_pressCount'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
      drawer: Drawer(
        child: new ListView(
          children: [
            new DrawerHeader(
              child: new Text("My drawer Header"),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new Text("My drawer item 1"),
            new Text("My drawer item 2"),
            new Text("My drawer item 3"),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            label: "Search",
          )
        ],
        onTap: onTap,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: onPress,
        child: new Icon(Icons.add),
      ),
    );
  }

  void onTap(int item) {
    setState(() {
      incrementPressCont();
    });
  }

  void onPress() {
    setState(() {
      incrementPressCont();
    });
  }

  void incrementPressCont() {
    _pressCount += 1;
  }
}
