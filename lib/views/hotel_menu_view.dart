import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/fliter_view.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:sould_food_guide/views/search_hotels_view.dart';

class HotelMenuScreen extends StatefulWidget {
  @override
  _HotelMenuScreenState createState() => _HotelMenuScreenState();
}

class _HotelMenuScreenState extends State<HotelMenuScreen> {
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
                height: 120,
                width: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Manhattan, New York",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                  Text(
                    "Check In 23 July  |  Check Out 28 July  |  2 Guests",
                    style: TextStyle(
                        color: Color(0XFFB5B5B5),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
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

        InkWell(
          onTap: () {
            Util.open(context, SearchHotelScreen());
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "short & filters",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
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
      child: Container(
        height: 200,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                Util.open(context, HotelDetailScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                margin: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,

                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)),
                            child: Image.asset(
                              "assets/img_13.png",
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Thailand Packages",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9,
                                  color: Colors.black),
                            ),

                            Text(
                              "\$456.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9,
                                  color: Color(0XFFFF8106)),
                            ),
                          ],
                        ),
                        Text(
                          "3 Days Nights",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
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
