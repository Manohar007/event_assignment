import 'package:amplify_flutter_clean_framework/bloc/bloc.dart';
import 'package:amplify_flutter_clean_framework/service/amplify_service.dart';
import 'package:assignment/all_events/api/all_events_response_model.dart';
import 'package:assignment/all_events/api/all_events_service.dart';
import 'package:assignment/all_events/model/all_events_business_model.dart';
import 'package:assignment/all_events/model/all_events_view_model.dart';

import '../../api_utils.dart';

class AllEventsBloc extends Bloc with AmplifyServiceResponseHandler {
  EventPipe getAllEventPipe = EventPipe();
  BroadcastPipe<AllEventsViewModel> broadcastViewModel = BroadcastPipe();
  late AllEventsService getAllEventsService;
  late AllEventsBusinessModel businessModel;

  AllEventsBloc() {
    getAllEventPipe.listen(_getAllEvents);
    getAllEventsService = AllEventsService(url: getAllEvents, handler: this);
    businessModel = AllEventsBusinessModel();
  }

  _getAllEvents() async {
    AllEventsResponseModel? responseModel = await getAllEventsService.request();
    if (responseModel != null) {
      businessModel.updateEvents(responseModel);
      broadcastViewModel.send(_createViewModel());
    }
  }

  AllEventsViewModel _createViewModel() {
    return AllEventsViewModel(
        allEvents: businessModel.allEvents
            .map((e) => EventObjectViewModel(
                name: e.name!,
                dateTime: e.dateTime!,
                bookBy: e.bookBy!,
                ticketsSold: e.ticketsSold!,
                maxTickets: e.maxTickets!,
                friendsAttending: e.friendsAttending!,
                price: e.price!,
                isPartnered: e.isPartnered!,
                sport: e.sport!,
                totalPrize: e.totalPrize!,
                location: e.location!,
                isRecommended: e.isRecommended!,
                mainImage: e.mainImage!,
                id: e.id!))
            .toList());
  }

  @override
  void onInvalidRequest(Error error) {}

  @override
  void onInvalidSession() {}

  @override
  void onServerError() {}

  @override
  void onUnexpectedContent(Exception exception) {}
}
