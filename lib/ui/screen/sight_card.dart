import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../../domain/sight.dart";
import '../style/default.dart';

/// Карточка списка интересных мест
class SightCard extends StatelessWidget {
  final Sight _sight;

  static const double _photoMinHeight = 96;

  static const EdgeInsets _photoPadding = EdgeInsets.only(
    top: defaultEdgeInsets,
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
  );
  static const EdgeInsets _photoNameMargin = EdgeInsets.only(
    top: defaultEdgeInsets,
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
  );
  static const EdgeInsets _photoFavoritesButtonMargin = EdgeInsets.only(
    top: 19,
    right: 18,
  );
  static const Radius _photoTopRadius = Radius.circular(16);

  static const double _infoMinHeight = 92;
  static const EdgeInsets _infoDescriptionMargin = EdgeInsets.only(
    top: defaultEdgeInsets,
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
    bottom: 2,
  );
  static const EdgeInsets _infoShortDescriptionMargin = EdgeInsets.only(
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
  );
  static const Radius _infoBottomRadius = Radius.circular(12);

  @override
  Widget build(BuildContext context) {
    // // в задании сказано: "ограничить размер текста  по ширине до половины размера карточки"
    // // а как этого добиться в условиях огромного зоопарка устройств андроид нет и намека.
    // // нагуглил такой способ узнать ширину экрана и собираюсь от этого плясать.
    // double _screenWidth = MediaQuery.of(context).size.width;
    // // З.Ы. возможно я конечно загоняюсь, но хардкодить циферку из фигмы мне внутренний перфекционист не позволяет.

    // // огарничение ширины для текста будет "пол ширины экрана" минус два обычных отступа (по дизайну они 16)
    // double textWidth = _screenWidth / 2 - 2 * defaultEdgeInsets;
    // BoxConstraints textConstraints =
    //     BoxConstraints(minWidth: textWidth, maxWidth: textWidth);

    // // чтобы оценить эффект от экспериментов добавлю границу контейнеру
    // BoxDecoration experimentBorder = BoxDecoration(
    //   border: new Border.all(
    //       color: Colors.black, width: 0.1, style: BorderStyle.solid),
    // );

    return //AspectRatio(
        // AspectRatio используйте, чтобы привести виджеты SightCard в соотношение 3/2
        //aspectRatio: 3 / 2,
        //child:
        Container(
      //decoration: experimentBorder,
      padding: _photoPadding,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: _photoMinHeight,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: _photoTopRadius,
                  topRight: _photoTopRadius,
                ),
                color: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: _photoNameMargin,
                    child: Container(
                      //decoration:
                      //    experimentBorder, // чтобы оценить эффект от ограничения ширины текста добавлю границу контейнеру с текстом
                      //child: ConstrainedBox(
                      //constraints: textConstraints,
                      child: Text(
                        _sight.type,
                        textAlign: TextAlign.left,
                        style: photoNameTextStile,
                      ),
                      //),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: _photoFavoritesButtonMargin,
                    color: Colors.blue,
                    child: SizedBox(
                      width: 20,
                      height: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   // Добавьте отступ между между фотографиями и описанием с помощью SizedBox
          //   height: 20,
          // ),
          Container(
            constraints: BoxConstraints(
              minHeight: _infoMinHeight,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: _infoBottomRadius,
                bottomRight: _infoBottomRadius,
              ),
              color: infoBackgroundColor,
            ),
            child: Column(
              children: [
                Container(
                  margin: _infoDescriptionMargin,
                  constraints: BoxConstraints(
                    minHeight: 40,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    _sight.details,
                    textAlign: TextAlign.left,
                    style: infoDescriptionTextStile,
                  ),
                ),
                Container(
                  margin: _infoShortDescriptionMargin,
                  alignment: Alignment.topLeft,
                  child: Text(
                    _sight.name,
                    textAlign: TextAlign.left,
                    style: infoShortDescriptionTextStile,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //),
    );
  }

  SightCard(this._sight);
}
