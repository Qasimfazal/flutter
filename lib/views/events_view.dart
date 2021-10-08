import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/event_detail_view.dart';
import 'package:sould_food_guide/views/fliter_view.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      primary: true,
      scrollDirection: Axis.vertical,
      children: [
        Stack(
          children: [
            ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.45), BlendMode.darken),
                child: Image.asset(
                  "assets/img_10.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 150,
                )),
            Container(
              margin: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Util.popBack(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset(
                        "assets/ic_back.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Search Events",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0XFFB5B5B5)),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.location_on_rounded,
                            color: Color(0XFFFF8106),
                            size: 15,
                          )),
                      Text(
                        "Manhattan, New York",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, right: 5),
                    width: double.infinity,
                    height: 1,
                    color: Color(0XFF8F8F8F),
                  ),

                ],
              ),
            ),
          ],
        ),
        // getHorizontalList("Exclusive places"),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return getHorizontalList("Exclusive places");
              }),
        ),

        // InkWell(
        //   onTap: () {
        //     // Util.open(context, MainScreen());
        //   },
        //   child: Container(
        //     height: 55,
        //     margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
        //     decoration: Util.getPrimaryButtonDecoration(),
        //     child: Center(
        //       child: Text(
        //         "short & filters",
        //         style: TextStyle(color: Colors.white, fontSize: 18),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        onTap: () {
          Util.open(context, FilterScreen());
        },
        child: Container(
          height: 50,
          decoration: Util.getSecondaryButtonDecoration(),
          child: Center(
            child: Text(
              "short & filters",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: SafeArea(child: body),
    );
  }

  Widget getHorizontalList(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Container(
        height: 195,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: (){
                    Util.open(context, EventDetailScreen());
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    margin: EdgeInsets.only(right: 10),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.7,
                          height: 130,
                      margin: EdgeInsets.only(bottom: 5),
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            child: Image.asset(
                              "assets/img_12.png",
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Event Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 22,
                              width: 54,
                              decoration: Util.getPrimaryButtonDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Manhattan, New York",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0XFF828282)),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
