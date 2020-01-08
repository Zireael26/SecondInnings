import 'package:meta/meta.dart';

class EventItem {
  String name;
  String description;
  String eventUrl;
  String photoUrl;
  DateTime time;
  String venueName;
  String city;
  String country;

  EventItem(
    {
      @required this.name,
      @required this.description,
      @required this.eventUrl,
      @required this.photoUrl,
      @required this.time,
      @required this.venueName,
      @required this.city,
      @required this.country,
    }
  );
}