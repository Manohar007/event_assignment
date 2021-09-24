import 'package:amplify_flutter_clean_framework/model.dart';
import 'package:assignment/all_events/api/all_events_response_model.dart';

class AllEventsBusinessModel extends BusinessModel {
  List<EventObjectBusinessModel> allEvents = [];

  void updateEvents(AllEventsResponseModel responseModel) {
    if (responseModel.allEvents != null) {
      responseModel.allEvents!.forEach((element) {
        EventObjectBusinessModel model = EventObjectBusinessModel(
          name: element.name,
          bookBy: element.bookBy,
          dateTime: element.dateTime,
          friendsAttending: element.friendsAttending,
          id: element.id,
          isPartnered: element.isPartnered,
          isRecommended: element.isRecommended,
          location: element.location,
          mainImage: element.mainImage,
          maxTickets: element.maxTickets,
          price: element.price,
          sport: element.sport,
          ticketsSold: element.ticketsSold,
          totalPrize: element.totalPrize,
        );
        allEvents.add(model);
      });
    }
  }
}

class EventObjectBusinessModel extends BusinessModel {
  String? name;
  String? dateTime;
  String? bookBy;
  int? ticketsSold;
  int? maxTickets;
  int? friendsAttending;
  double? price;
  bool? isPartnered;
  String? sport;
  int? totalPrize;
  String? location;
  bool? isRecommended;
  String? mainImage;
  int? id;

  EventObjectBusinessModel(
      {this.name,
      this.dateTime,
      this.bookBy,
      this.ticketsSold,
      this.maxTickets,
      this.friendsAttending,
      this.price,
      this.isPartnered,
      this.sport,
      this.totalPrize,
      this.location,
      this.isRecommended,
      this.mainImage,
      this.id});
}
