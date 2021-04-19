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
    return Container(
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
                image: DecorationImage(
                  image: AssetImage("res/pictures/CardsPicture.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: _photoNameMargin,
                    child: Container(
                      child: Text(
                        _sight.type,
                        textAlign: TextAlign.left,
                        style: photoNameTextStile,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: _photoFavoritesButtonMargin,
                    child: SizedBox(
                      width: 22,
                      height: 20,
                      child: Image.asset("res/pictures/SightCardFavorite.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    );
  }

  SightCard(this._sight);
}
