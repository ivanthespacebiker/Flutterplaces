// Карточка списка интересных мест

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../../domain/sight.dart";

class SightCard extends StatelessWidget {
  final Sight _sight;

  static const double _photoMinHeight = 96;
  static const EdgeInsets _photoPadding = EdgeInsets.only(
    top: 16,
    left: 16,
    right: 16,
  );
  static const EdgeInsets _photoNameMargin = EdgeInsets.only(
    top: 16,
    left: 16,
    right: 16,
  );
  static const EdgeInsets _photoLikeMargin = EdgeInsets.only(
    top: 19,
    right: 18,
  );
  static const TextStyle _photoNameTextStile = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    height: 1.29,
  );
  static const Radius _photoTopRadius = Radius.circular(16);

  static const double _infoMinHeight = 92;
  static const Color _infoBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
  static const TextStyle _infoDescriptionTextStile = TextStyle(
    color: Color.fromRGBO(59, 62, 91, 1),
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    height: 1.25,
  );
  static const EdgeInsets _infoDescriptionMargin = EdgeInsets.only(
    top: 16,
    left: 16,
    right: 16,
    bottom: 2,
  );
  static const TextStyle _infoShortDescriptionTextStile = TextStyle(
    color: Color.fromRGBO(124, 126, 146, 1),
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    height: 1.29,
  );
  static const EdgeInsets _infoShortDescriptionMargin = EdgeInsets.only(
    left: 16,
    right: 16,
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
                color: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: _photoNameMargin,
                    child: Text(
                      _sight.type,
                      textAlign: TextAlign.left,
                      style: _photoNameTextStile,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: _photoLikeMargin,
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
          Container(
            constraints: BoxConstraints(
              minHeight: _infoMinHeight,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: _infoBottomRadius,
                bottomRight: _infoBottomRadius,
              ),
              color: _infoBackgroundColor,
            ),
            child: Column(
              children: [
                Container(
                  margin: _infoDescriptionMargin,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 40,
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      _sight.details,
                      textAlign: TextAlign.left,
                      style: _infoDescriptionTextStile,
                    ),
                  ),
                ),
                Container(
                  margin: _infoShortDescriptionMargin,
                  alignment: Alignment.topLeft,
                  child: Text(
                    _sight.name,
                    textAlign: TextAlign.left,
                    style: _infoShortDescriptionTextStile,
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
