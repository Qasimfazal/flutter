import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/events_view.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:sould_food_guide/views/hotel_view.dart';
import 'package:sould_food_guide/views/restuarants_view.dart';
import 'package:sould_food_guide/views/search_flights_view.dart';
import 'package:sould_food_guide/views/search_hotels_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Colors.black.withOpacity(0.60), BlendMode.darken),
              child: Image.asset(
                "assets/img_2.png",
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 15, top: 8),
                      child: Text(
                        "Hey Sam, \nWhere you wanna go?".toUpperCase(),
                        style: TextStyle(color: Colors.white, fontWeight:FontWeight.w600,fontSize: 24),
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
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Util.open(context, SearchFlightsScreen());
                    },
                    child: Container(
                      width: 75,
                      height: 69,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 2,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          "assets/ic_plane.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Flight",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Util.open(context, HotelScreen());
                    },
                    child: Container(
                      width: 75,
                      height: 69,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 2,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          "assets/ic_hotel.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Hotels",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Util.open(context, RestaurantsScreen());
                    },
                    child: Container(
                      width: 75,
                      height: 69,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 2,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          "assets/ic_restaurant.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Restaurant",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Util.open(context, EventsScreen());
                    },
                    child: Container(
                      width: 75,
                      height: 69,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 2,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          "assets/ic_event.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Events",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black),
                  )
                ],
              ),
            ],
          ),
        ),
        // getHorizontalList("Exclusive places"),
        ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return getHorizontalList("Exclusive places".toUpperCase());
            }),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: body),
    );
  }

  Widget getHorizontalList(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w600),
          ),
          Container(
            height: 190,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    Util.open(context, HotelDetailScreen());
                  },
                  child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.asset(
                                  "assets/img_4.png",
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.7,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "Thailand Packages",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9,

                                  color: Colors.black),
                            ),
                            Text(
                              "3 Days Nights",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8,
                                  color: Color(0XFF828282)),
                            ),
                            Text(
                              "\$456.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9,
                                  color: Color(0XFFFF8106)),
                            ),
                          ],
                        ),
                      ),
                )),
          )
        ],
      ),
    );
  }
}
