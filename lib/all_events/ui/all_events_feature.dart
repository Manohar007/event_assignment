import 'package:amplify_flutter_clean_framework/bloc/bloc.dart';
import 'package:assignment/all_events/bloc/all_events_bloc.dart';
import 'package:assignment/all_events/ui/all_events_presenter.dart';
import 'package:flutter/material.dart';

class AllEventsFeature extends StatelessWidget {
  const AllEventsFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(child: AllEventsPresenter(), bloc: AllEventsBloc());
  }
}
