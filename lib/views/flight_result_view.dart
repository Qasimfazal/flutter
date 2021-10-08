import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/util/customTabView.dart';
import 'package:sould_food_guide/views/fliter_view.dart';

class FlightResultScreen extends StatefulWidget {
  @override
  _FlightResultScreenState createState() => _FlightResultScreenState();
}

class _FlightResultScreenState extends State<FlightResultScreen> {
  @override
  Widget build(BuildContext context) {
    final body = Column(
        mainAxisSize: MainAxisSize.min,
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
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 120,
                  )),
              Container(
                margin: EdgeInsets.only(left: 10, top: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        "Houston To Manhattan",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                        child: Text(
                      "Depart In 23 July  |  1 Traveler  | Economy",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0XFFB5B5B5)),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: CustomTabView(
            initPosition: 0,
            itemCount: 7,
            tabBuilder: (context, index) => Column(
              children: [
                Text(
                  "23 Jul",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF828282),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "\$ 185.50",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            pageBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                color: Color(0XFFF5F5F5),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                            elevation: 1,
                            color: Colors.white,
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "American Airlines",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "AA-1264",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0XFF828282),
                                              fontSize: 10),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 65,
                                          decoration:
                                              Util.getPrimaryButtonDecoration(),
                                          child: Center(
                                            child: Text(
                                              "\$ 158.50",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    height: 1,
                                    color: Color(0XFFF2F2F2),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 44,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0XFFF5F5F5),
                                          ),
                                          height: 44,
                                          child: Center(
                                            child: Image.asset(
                                                "assets/img_5.png",
                                                fit: BoxFit.scaleDown,
                                                width: 36,
                                                height: 14),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "12:00 am",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Houston",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Color(0XFF828282)),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: 2,
                                                decoration: Util
                                                    .getPrimaryButtonDecoration(),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 9,
                                                    height: 9,
                                                    decoration: Util
                                                        .getPrimaryButtonDecoration(),
                                                  ),
                                                  Container(
                                                    width: 9,
                                                    height: 9,
                                                    decoration: Util
                                                        .getPrimaryButtonDecoration(),
                                                  ),
                                                  Container(
                                                    width: 9,
                                                    height: 9,
                                                    decoration: Util
                                                        .getPrimaryButtonDecoration(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "12:00 am",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Houston",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Color(0XFF828282)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
              );
            },
            onPositionChange: (index) {
              print("----->> $index");
            },
            onScroll: (position) {
              print('onScroll $position');
            },
          ))
        ]);
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
      body: SafeArea(
        child: body,
      ),
    );
  }
}
