import 'package:amplify_flutter_clean_framework/ui/presenter.dart';
import 'package:assignment/all_events/bloc/all_events_bloc.dart';
import 'package:assignment/all_events/model/all_events_view_model.dart';
import 'package:assignment/all_events/ui/all_events_screen.dart';
import 'package:assignment/colors.dart';
import 'package:flutter/material.dart';

class AllEventsPresenter extends Presenter<AllEventsBloc, AllEventsViewModel> {
  @override
  Widget buildScreen(
      BuildContext context, AllEventsBloc bloc, AllEventsViewModel viewModel) {
    return AllEventsScreen(viewModel: viewModel);
  }

  @override
  Stream<AllEventsViewModel?> getViewModelStream(
      BuildContext context, AllEventsBloc bloc) {
    return bloc.broadcastViewModel.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
      color: basePurpleColor,
    );
  }

  @override
  void sendViewModelRequest(BuildContext context, AllEventsBloc bloc) {
    bloc.getAllEventPipe.launch();
  }
}
