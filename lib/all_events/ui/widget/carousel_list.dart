import 'package:assignment/all_events/model/all_events_view_model.dart';
import 'package:assignment/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselListView extends StatefulWidget {
  const CarouselListView({Key? key, required this.viewModel}) : super(key: key);
  final AllEventsViewModel viewModel;

  @override
  _CarouselListViewState createState() => _CarouselListViewState();
}

class _CarouselListViewState extends State<CarouselListView> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Recommended Events",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff565066)),
              ),
            ),
            Text(
              "View all",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xffE77460),
              ),
            )
          ],
        ),
        padding: EdgeInsets.all(20.0),
      ),
      CarouselSlider(
          items: _getCarouselList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: false,
            aspectRatio: 2.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, _) {
              setState(() {
                _current = index;
              });
            },
          )),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.viewModel.allEvents.map(
            (image) {
              //these two lines
              int index =
                  widget.viewModel.allEvents.indexOf(image); //are changed
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            },
          ).toList())
    ]);
  }

  List<Widget> _getCarouselList() {
    List<Widget> list = [];
    widget.viewModel.allEvents.forEach((element) {
      list.add(Stack(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: CachedNetworkImage(
              imageUrl: element.mainImage,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        element.dateTime,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        element.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.white),
                      )
                    ])),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset("assets/ticket_icon.png"),
                            Text(
                              element.ticketsSold.toString() +
                                  "/" +
                                  element.maxTickets.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        padding: EdgeInsets.only(
                            left: 8.0, right: 5, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    child: Image.asset(
                                        "assets/img_female_profile.png"),
                                    radius: 7,
                                    backgroundColor: Colors.white,
                                  ),
                                  padding: EdgeInsets.only(left: 7.0),
                                ),
                                CircleAvatar(
                                  child: Image.asset(
                                    "assets/img_male_profile.png",
                                  ),
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "+" +
                                  element.friendsAttending.toString() +
                                  " friends",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      Container(
                        child: Text(
                          "€" + element.price.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border.all(
                              color: secondaryColor,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ],
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          )
        ],
      ));
    });

    return list;
  }
}
