class Sight {
  String name;
  int lat;
  int lon;
  String url;
  String details;
  String type;

  Sight({
    String name,
    int lat,
    int lon,
    String url,
    String details,
    String type,
  })  : this.name = name,
        this.lat = lat,
        this.lon = lon,
        this.url = url,
        this.details = details,
        this.type = type;
}

class VisitedSight extends Sight {
  String visited;
  VisitedSight({
    String name,
    int lat,
    int lon,
    String url,
    String details,
    String type,
    String visited,
  })  : this.visited = visited,
        super(
            name: name,
            lat: lat,
            lon: lon,
            url: url,
            details: details,
            type: type);

  VisitedSight.fromSight({
    Sight sight,
    String visited,
  })  : this.visited = visited,
        super(
            name: sight.name,
            lat: sight.lat,
            lon: sight.lon,
            url: sight.url,
            details: sight.details,
            type: sight.type);
}

class WantToVisitSight extends Sight {
  String planned;
  WantToVisitSight({
    String name,
    int lat,
    int lon,
    String url,
    String details,
    String type,
    String planned,
  })  : this.planned = planned,
        super(
            name: name,
            lat: lat,
            lon: lon,
            url: url,
            details: details,
            type: type);

  WantToVisitSight.fromSight({
    Sight sight,
    String planned,
  })  : this.planned = planned,
        super(
            name: sight.name,
            lat: sight.lat,
            lon: sight.lon,
            url: sight.url,
            details: sight.details,
            type: sight.type);
}
