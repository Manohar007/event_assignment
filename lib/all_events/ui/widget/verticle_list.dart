import 'dart:math';

import 'package:assignment/all_events/model/all_events_view_model.dart';
import 'package:assignment/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VerticalListView extends StatefulWidget {
  const VerticalListView({Key? key, required this.viewModel}) : super(key: key);
  final AllEventsViewModel viewModel;

  @override
  _VerticalListViewState createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getVerticalList(),
    );
  }

  List<Widget> _getVerticalList() {
    List<Widget> list = [];
    widget.viewModel.allEvents.reversed.forEach((element) {
      list.add(Container(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 5,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: element.mainImage,
                fit: BoxFit.fill,
                height: 200.0,
                width: double.infinity,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text("Total Prize: €" +
                                element.totalPrize.toString())),
                        Icon(
                          Icons.ios_share,
                          color: Color(0xff475464),
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "assets/ic_like.png",
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.av_timer_sharp,
                          color: Color(0xff475464),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Time left to Book: ",
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(Random().nextInt(50).toString() + " hours ",
                            style: TextStyle(
                                color: Color(0xff475464),
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/ticket_icon.png",
                            height: 15, width: 15, color: Color(0xff475464)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          element.friendsAttending.toString() +
                              "/" +
                              element.maxTickets.toString() +
                              " attending total",
                          style: TextStyle(
                              color: basePurpleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/ic_location.png",
                            height: 15, width: 15, color: Color(0xff475464)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(element.location,
                                style: TextStyle(
                                    color: Color(0xff475464),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))),
                        Text(Random().nextInt(100).toString() + " km",
                            style: TextStyle(
                                color: Color(0xff475464),
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              )
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
      ));
    });

    return list;
  }
}
