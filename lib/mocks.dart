import "domain/sight.dart";

final List<Sight> mocks = [
  Sight(
    name: "Музей подводных сил России имени Александра Маринеско",
    lat: 0,
    lon: 1,
    url: "https://URL1",
    details: "закрыто до 09:00",
    type: "музей",
  ),
  Sight(
    name: "Воронежский областной краеведческий музей",
    lat: 1,
    lon: 0,
    url: "https://URL2",
    details: "краткое описание",
    type: "музей",
  ),
  Sight(
    name: "Пряности и радости",
    lat: 1,
    lon: 1,
    url: "https://URL3",
    details: "закрыто до 09:00",
    type: "ресторан",
  ),
];

final List<VisitedSight> mocsVisited = [
  // VisitedSight.fromSight(
  //   sight: mocks[0],
  //   visited: "Цель достигнута 12 окт. 2020",
  // )
];

final List<WantToVisitSight> mocsWantToVisit = [
  // WantToVisitSight.fromSight(
  //   sight: mocks[2],
  //   planned: "Запланировано на 12 окт. 2020",
  // )
];
