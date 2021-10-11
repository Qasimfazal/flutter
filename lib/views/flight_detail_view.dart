import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/flight_confirm_booking_view.dart';

class FlightDetailScreen extends StatefulWidget {
  @override
  _FlightDetailScreenState createState() => _FlightDetailScreenState();
}

class _FlightDetailScreenState extends State<FlightDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
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
                onTap: () {
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
                  "23 Jul, 2021 | 1 | Traveler",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "23 Jul, 12:00 am",
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
                  "24 Jul, 12:30  am ",
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
                    top: 10,
                    right: 10,
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
                child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0XFFF5F5F5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Text(
                            "6 KG Hand baggage",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        )),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0XFFF5F5F5),
                            ),
                            height: 54,
                            child: Center(
                              child: Image.asset("assets/img_5.png",
                                  fit: BoxFit.scaleDown, width: 36, height: 14),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "American Airlines",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "AA-1264",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0XFF828282)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0XFFF5F5F5)),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Economy",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "50 Seats Left",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0XFF828282)),
                              ),
                            ],
                          ),
                          Text(
                            "\$ 158.50",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFFF9902)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0XFFF5F5F5)),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Premium Economy",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "70 Seats Left",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0XFF828282)),
                              ),
                            ],
                          ),
                          Text(
                            "\$ 158.50",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFFF9902)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0XFFF5F5F5)),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Economy",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "50 Seats Left",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0XFF828282)),
                              ),
                            ],
                          ),
                          Text(
                            "\$ 158.50",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFFF9902)),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Util.open(context, FlightConfirmBookingScreen());
                      },
                      child: Container(
                        height: 55,
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 15),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: Util.getPrimaryButtonDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(TextSpan(
                                text: "\$158.00  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: "For 1 Traveler"
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ])),
                            Text(
                              "BOOK NOW",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
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
