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
                        rightButtons: _SightCardPhotoRightButtons(),
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

/// Карточка списка "Хочу посетить"
class SightCardWantToVisit extends SightCard {
  @override
  final WantToVisitSight _sight;
  const SightCardWantToVisit({
    Key key,
    @required WantToVisitSight sight,
  })  : _sight = sight,
        super(key: key, sight: sight);

  static const EdgeInsets _cardsPadding = SightCard._cardsPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _cardsPadding,
      child: Column(
        children: [
          _SightCardPhoto(
            type: _sight.type,
            rightButtons: _SightCardWantToVisitPhotoRightButtons(),
          ),
          _SightCardInfoWantToVisit(
            name: _sight.name,
            details: _sight.details,
            planned: _sight.planned,
          ),
        ],
      ),
    );
  }
}

/// Карточка списка "Посетил"
class SightCardVisited extends SightCard {
  @override
  final VisitedSight _sight;
  const SightCardVisited({
    Key key,
    @required VisitedSight sight,
  })  : _sight = sight,
        super(key: key, sight: sight);

  static const EdgeInsets _cardsPadding = SightCard._cardsPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _cardsPadding,
      child: Column(
        children: [
          _SightCardPhoto(
            type: _sight.type,
            rightButtons: _SightCardVisitedPhotoRightButtons(),
          ),
          _SightCardInfoVisited(
            name: _sight.name,
            details: _sight.details,
            visited: _sight.visited,
          ),
        ],
      ),
    );
  }
}

/// часть карточки места с фотографией
class _SightCardPhoto extends StatelessWidget {
  final Widget _rightButtons;
  const _SightCardPhoto({
    Key key,
    @required String type,
    @required Widget rightButtons,
  })  : _type = type,
        _rightButtons = rightButtons,
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
            image: AssetImage(cardsPicture),
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
              child: _rightButtons,
            ),
          ],
        ),
      ),
    );
  }
}

/// кнопки справа для карточки интересных мест
class _SightCardPhotoRightButtons extends StatelessWidget {
  const _SightCardPhotoRightButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 20,
      child: Image.asset(sightCardFavorite),
    );
  }
}

/// кнопки справа для карточки "Хочу посетить"
class _SightCardWantToVisitPhotoRightButtons extends StatelessWidget {
  const _SightCardWantToVisitPhotoRightButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: defaultEdgeInsets,
          ),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(sightCardCalendar),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: defaultEdgeInsets,
          ),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(sightCardCross),
          ),
        ),
      ],
    );
  }
}

/// кнопки справа для карточки "Посетил"
class _SightCardVisitedPhotoRightButtons extends StatelessWidget {
  const _SightCardVisitedPhotoRightButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: defaultEdgeInsets,
          ),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(sightCardShare),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: defaultEdgeInsets,
          ),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(sightCardCross),
          ),
        ),
      ],
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
    bottom: defaultEdgeInsets,
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
              minHeight: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _name,
              textAlign: TextAlign.left,
              style: infoDescriptionTextStile,
            ),
          ),
          Container(
            margin: _infoShortDescriptionMargin,
            alignment: Alignment.topLeft,
            child: Text(
              _details,
              textAlign: TextAlign.left,
              style: infoShortDescriptionTextStile,
            ),
          ),
        ],
      ),
    );
  }
}

/// часть карточки "Хочу посетить" с информацией
class _SightCardInfoWantToVisit extends _SightCardInfo {
  final String _planned;
  const _SightCardInfoWantToVisit({
    Key key,
    @required String details,
    @required String name,
    @required String planned,
  })  : _planned = planned,
        super(key: key, details: details, name: name);

  static const double _infoMinHeight = 102;
  static const EdgeInsets _infoDescriptionMargin =
      _SightCardInfo._infoDescriptionMargin;
  static const EdgeInsets _infoShortDescriptionMargin =
      _SightCardInfo._infoShortDescriptionMargin;
  static const Radius _infoBottomRadius = _SightCardInfo._infoBottomRadius;

  static const EdgeInsets _infoShortVisitedMargin = EdgeInsets.only(
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
    top: 2,
    bottom: 2,
  );

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
              minHeight: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _name,
              textAlign: TextAlign.left,
              style: wantToVisitInfoDescriptionTextStile,
            ),
          ),
          Container(
            margin: _infoShortVisitedMargin,
            constraints: BoxConstraints(
              minHeight: 28,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _planned,
              textAlign: TextAlign.left,
              style: wantToVisitInfoPlannedTextStile,
            ),
          ),
          Container(
            margin: _infoShortDescriptionMargin,
            constraints: BoxConstraints(
              minHeight: 18,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _details,
              textAlign: TextAlign.left,
              style: wantToVisitInfoModeTextStile,
            ),
          ),
        ],
      ),
    );
  }
}

/// часть карточки "Посетил" с информацией
class _SightCardInfoVisited extends _SightCardInfo {
  final String _visited;
  const _SightCardInfoVisited({
    Key key,
    @required String details,
    @required String name,
    @required String visited,
  })  : _visited = visited,
        super(key: key, details: details, name: name);

  static const double _infoMinHeight = 102;
  static const EdgeInsets _infoDescriptionMargin =
      _SightCardInfo._infoDescriptionMargin;
  static const EdgeInsets _infoShortDescriptionMargin =
      _SightCardInfo._infoShortDescriptionMargin;
  static const Radius _infoBottomRadius = _SightCardInfo._infoBottomRadius;

  static const EdgeInsets _infoShortVisitedMargin = EdgeInsets.only(
    left: defaultEdgeInsets,
    right: defaultEdgeInsets,
    top: 2,
    bottom: 2,
  );

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
              minHeight: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _name,
              textAlign: TextAlign.left,
              style: visitedInfoDescriptionTextStile,
            ),
          ),
          Container(
            margin: _infoShortVisitedMargin,
            constraints: BoxConstraints(
              minHeight: 28,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _visited,
              textAlign: TextAlign.left,
              style: visitedInfoVisitedTextStile,
            ),
          ),
          Container(
            margin: _infoShortDescriptionMargin,
            constraints: BoxConstraints(
              minHeight: 18,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              _details,
              textAlign: TextAlign.left,
              style: visitedInfoModeTextStile,
            ),
          ),
        ],
      ),
    );
  }
}
