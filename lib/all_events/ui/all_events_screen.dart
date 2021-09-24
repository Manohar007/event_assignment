import 'package:assignment/all_events/model/all_events_view_model.dart';
import 'package:assignment/all_events/ui/widget/carousel_list.dart';
import 'package:assignment/all_events/ui/widget/verticle_list.dart';
import 'package:assignment/colors.dart';
import 'package:flutter/material.dart';

class AllEventsScreen extends StatelessWidget {
  final AllEventsViewModel viewModel;

  const AllEventsScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, right: 5.0),
                      child: Icon(
                        Icons.notifications_none_sharp,
                        color: Colors.white,
                        size: 22,
                      )),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Text(
                        " 3 ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12),
                      ),
                    ),
                    right: 1,
                  )
                ],
              ))
        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchUi(),
              CarouselListView(
                viewModel: viewModel,
              ),
              VerticalListView(
                viewModel: viewModel,
              ),
            ],
          ),
          scrollDirection: Axis.vertical,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    "Add Event + ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(basePurpleColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: basePurpleColor))),
                  ),
                ),
              ],
            ))
      ]),
      backgroundColor: Color(0xffF9F6F6),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  _buildBottomNavigation() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text('Favourite')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text('Favourite'))
            ],
          ),
        ));
  }

  _buildSearchUi() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
          color: basePurpleColor,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(20.0),
              bottomEnd: Radius.circular(20.0))),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(0.1),
              filled: true,
              contentPadding: EdgeInsets.all(2.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.0),
              ),
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: 'Search by Event, code, location',
              prefixIcon: Image.asset("assets/ic_search.png"),
              suffixIcon: Image.asset("assets/ic_filter.png"),
            ),
          ))
        ],
      ),
    );
  }
}
