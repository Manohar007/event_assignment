import 'package:amplify_flutter_clean_framework/model.dart';

class AllEventsViewModel extends ViewModel {
  final List<EventObjectViewModel> allEvents;

  AllEventsViewModel({required this.allEvents});
}

class EventObjectViewModel {
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

  EventObjectViewModel(
      {required this.name,
      required this.dateTime,
      required this.bookBy,
      required this.ticketsSold,
      required this.maxTickets,
      required this.friendsAttending,
      required this.price,
      required this.isPartnered,
      required this.sport,
      required this.totalPrize,
      required this.location,
      required this.isRecommended,
      required this.mainImage,
      required this.id});
}
