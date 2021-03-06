import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/style/picturesAssets.dart';
import "package:places/domain/sight.dart";
import 'package:places/ui/style/default.dart';

/// Экран детализации интересного места
class SightDetails extends StatefulWidget {
  final Sight _sight;
  @override
  _SightDetailsState createState() => _SightDetailsState();

  SightDetails(this._sight);
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    
    int _randomDalay() {
      Random r = new Random();
      return r.nextInt(1000);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder(
        future: Future.delayed(Duration(milliseconds: _randomDalay())),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? LinearProgressIndicator()
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage(sightDetailsPicture),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 361),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: defaultEdgeInsets, top: 36),
                            child: UnconstrainedBox(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 32,
                                height: 32,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: backgroundColor,
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: 25,
                                      height: 24,
                                      child: Image.asset(sightDetailsBack),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: defaultEdgeInsets,
                          right: defaultEdgeInsets,
                          top: 24,
                        ),
                        child: Text(
                          "Прянности и радости",
                          style: sightDetailsNameTextStyle,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: defaultEdgeInsets,
                          right: defaultEdgeInsets,
                          top: 2,
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(
                                right: defaultEdgeInsets,
                              ),
                              child: Text(
                                "ресторан",
                                style: sightDetailsTypeTextStyle,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "закрыто до 09.00",
                                style: sightDetailsModeTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: defaultEdgeInsets,
                          right: defaultEdgeInsets,
                          top: 24,
                        ),
                        child: Text(
                          "Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного",
                          style: sightDetailsDescriptionTextStyle,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          left: defaultEdgeInsets,
                          right: defaultEdgeInsets,
                          top: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromRGBO(76, 175, 80, 1),
                        ),
                        child: SizedBox(
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(sightDetailsRoute)),
                              ),
                              Text(
                                "ПОСТРОИТЬ МАРШРУТ",
                                style: sightDetailsRouteButtonTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: defaultEdgeInsets,
                          right: defaultEdgeInsets,
                          top: 24,
                        ),
                        decoration: BoxDecoration(
                          border: new Border(
                            top: new BorderSide(
                                color: Color.fromRGBO(124, 126, 146, 0.56),
                                width: 0.8,
                                style: BorderStyle.solid),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 11),
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Image.asset(sightDetailsCalendar),
                                      ),
                                    ),
                                    Text(
                                      "Запланировать",
                                      style:
                                          sightDetailsScheduleButtonTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 11),
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Image.asset(sightDetailsFavorite),
                                      ),
                                    ),
                                    Text(
                                      "В Избранное",
                                      style:
                                          sightDetailsFavoritesButtonTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
