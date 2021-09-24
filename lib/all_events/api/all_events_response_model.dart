import 'package:amplify_flutter_clean_framework/service/amplify_service.dart';

class AllEventsResponseModel extends ResponseModel {
  final List<EventObject>? allEvents;

  AllEventsResponseModel.fromJson(Map<String, dynamic> json)
      : allEvents = json["allEvents"] == null
            ? null
            : List<EventObject>.from(
                json["allEvents"].map(
                  (x) => EventObject.fromJson(x),
                ),
              ),
        super.fromJson(json);
}

class EventObject extends ResponseModel {
  final String name;
  final String dateTime;
  final String bookBy;
  final int ticketsSold;
  final int maxTickets;
  final int friendsAttending;
  final double price;
  final bool isPartnered;
  final String sport;
  final int totalPrize;
  final String location;
  final bool isRecommended;
  final String mainImage;
  final int id;

  EventObject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        dateTime = json["dateTime"],
        bookBy = json["bookBy"],
        ticketsSold = json["ticketsSold"],
        maxTickets = json["maxTickets"],
        friendsAttending = json["friendsAttending"],
        price = json["price"] is int
            ? (json['price'] as int).toDouble()
            : json['price'],
        isPartnered = json["isPartnered"],
        sport = json["sport"],
        totalPrize = json["totalPrize"],
        location = json["location"],
        isRecommended = json["isRecommended"],
        mainImage = json["mainImage"],
        id = json["id"],
        super.fromJson(json);
}
