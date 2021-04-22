import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/style/default.dart';
import 'package:places/ui/style/picturesAssets.dart';

/// Карточка списка интересных мест
class SightCard extends StatelessWidget {
  final Sight _sight;
  const SightCard({
    Key key,
    @required Sight sight,
  })  : _sight = sight,
        super(key: key);

  static const EdgeInsets _cardsPadding = EdgeInsets.only(
    top: defaultEdgeInsets,
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
  );

  @override
  Widget build(BuildContext context) {
    int _randomDalay() {
      Random r = new Random();
      return r.nextInt(1000);
    }

    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: _randomDalay())),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: _cardsPadding,
                  child: Column(
                    children: [
                      _SightCardPhoto(
                        type: _sight.type,
                      ),
                      _SightCardInfo(
                        name: _sight.name,
                        details: _sight.details,
                      ),
                    ],
                  ),
                ),
    );
  }
}

/// часть карточки места с фотографией
class _SightCardPhoto extends StatelessWidget {
  const _SightCardPhoto({
    Key key,
    @required String type,
  })  : _type = type,
        super(key: key);

  static const double _photoMinHeight = 96;

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

  final String _type;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
            image: AssetImage(CardsPicture),
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
                  _type,
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
                child: Image.asset(SightCardFavorite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// часть карточки места с информацией
class _SightCardInfo extends StatelessWidget {
  final String _details;
  final String _name;
  const _SightCardInfo({
    Key key,
    @required String details,
    @required String name,
  })  : _details = details,
        _name = name,
        super(key: key);

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
              _details,
              textAlign: TextAlign.left,
              style: infoDescriptionTextStile,
            ),
          ),
          Container(
            margin: _infoShortDescriptionMargin,
            alignment: Alignment.topLeft,
            child: Text(
              _name,
              textAlign: TextAlign.left,
              style: infoShortDescriptionTextStile,
            ),
          ),
        ],
      ),
    );
  }
}
