import 'package:amplify_flutter_clean_framework/service/amplify_service.dart';
import 'package:amplify_flutter_clean_framework/service/options.dart';
import 'package:amplify_flutter_clean_framework/service/rest_api.dart';
import 'package:assignment/api_utils.dart';

import 'all_events_response_model.dart';

class AllEventsService extends AmplifyService {
  final String url;
  final AmplifyServiceResponseHandler handler;

  AllEventsService({required this.url, required this.handler})
      : super(
            url: url,
            action: HttpAction.get,
            handler: handler,
            options: Options(
              headers: headers,
            ));

  @override
  AllEventsResponseModel parseJson(Map<String, dynamic> map) {
    return AllEventsResponseModel.fromJson(map);
  }
}
