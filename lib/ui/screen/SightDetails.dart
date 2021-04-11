import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../../domain/sight.dart";
import '../style/defalt.dart';

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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                color: Colors.red,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 361),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, top: 36),
                    child: UnconstrainedBox(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: backgroundColor,
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
                  left: 16,
                  right: 16,
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
                  left: 16,
                  right: 16,
                  top: 2,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                        right: 16,
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
                  left: 16,
                  right: 16,
                  top: 24,
                ),
                child: Text(
                  "Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного",
                  style: sightDetailsDetailsTextStyle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromRGBO(76, 175, 80, 1),
                ),
                child: SizedBox(
                  height: 48,
                  child: Center(
                    child: Text(
                      "ПОСТРОИТЬ МАРШРУТ",
                      style: sightDetailsRouteButtonTextStyle,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
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
                        child: Center(
                          child: Text(
                            "Запланировать",
                            style: sightDetailsScheduleButtonTextStyle,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 11),
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            "В Избранное",
                            style: sightDetailsFavoritesButtonTextStyle,
                          ),
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
    );
  }
}
