import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/flight_result_view.dart';
import 'package:sould_food_guide/views/main_view.dart';

class SearchFlightsScreen extends StatefulWidget {
  @override
  _SearchFlightsScreenState createState() => _SearchFlightsScreenState();
}

class _SearchFlightsScreenState extends State<SearchFlightsScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final body = Stack(
      children: [
        ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.60), BlendMode.darken),
            child: Image.asset(
              "assets/img_6.png",
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            )),
        Container(
          margin: EdgeInsets.only(left: 10, top: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Search Flight",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "From",
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
                    "HOU - Houston, USA",
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "To",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0XFFB5B5B5)),
                ),
              ),
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
                    "MHK - Manhattan, USA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 5,
                    right: 5,
                    bottom: MediaQuery.of(context).size.width * 0.13),
                width: double.infinity,
                height: 1,
                color: Color(0XFF8F8F8F),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0X26000000),
                          spreadRadius: 0,
                          blurRadius: 1),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TabBar(
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.black,

                  labelPadding: EdgeInsets.only(left: 0, right: 0),
                  indicator: BubbleTabIndicator(
                    indicatorHeight: 40.0,
                    padding:  EdgeInsets.only(left: 0, right: 0),
                    insets:EdgeInsets.only(left: 0, right: 0),
                    // indicatorColor: Color(0XFFFF3B14),
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    // Other flags
                    // indicatorRadius: 1,
                    // insets: EdgeInsets.all(1),
                    // padding: EdgeInsets.all(10)
                  ),
                  tabs: [
                    Tab(text: "round trip"),
                    Tab(
                      text: "One Way",
                    ),
                    Tab(
                      text: "multi city",
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "DEPARTURE",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0XFFFF8106)),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "23",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "JULY 2021",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Tuesday  ",
                                              style: TextStyle(
                                                  color: Color(0XFF828282),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "RETURN",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "28",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "JULY 2021",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Sunday  ",
                                              style: TextStyle(
                                                  color: Color(0XFF828282),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 18),
                          child: Text(
                            "TRAVELLERS",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFFF8106)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "02",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Adult",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "02",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Children",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "02",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Infrat",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 18),
                          child: Text(
                            "CABIN CLASS",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFFF8106)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Economy",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Class",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Util.open(context, FlightResultScreen());
                          },
                          child: Container(
                            height: 55,
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 30, bottom: 30),
                            decoration: Util.getPrimaryButtonDecoration(),
                            child: Center(
                              child: Text(
                                "show result",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(),
                    Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
