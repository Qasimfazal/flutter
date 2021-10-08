import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/hotel_view.dart';
import 'package:sould_food_guide/views/main_view.dart';

class SearchHotelScreen extends StatefulWidget {
  @override
  _SearchHotelScreenState createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState extends State<SearchHotelScreen>
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
    final body =
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Stack(
        children: [
          ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.60), BlendMode.darken),
              child: Image.asset(
                "assets/img_2.png",
                // fit: BoxFit.scaleDown,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              )),
          Container(
            margin: EdgeInsets.only(left: 10, top: 15, right: 15),
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
                    "Search Hotel",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Where are you going?",
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

              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 20,),
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
                    "CHECK IN",
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
                    "CHECK OUT",
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
          "GUESTS",
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
          "ROOMS",
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
                  "23",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "JULY 2021",
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

    ],);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        onTap: () {
          Util.popBack(context);
        },
        child: Container(
          height: 55,
          margin: EdgeInsets.only(
              left: 15, right: 15, top: 30, bottom: 30),
          decoration: Util.getPrimaryButtonDecoration(),
          child: Center(
            child: Text(
              "show result",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
