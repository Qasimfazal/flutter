import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/util/Util.dart';

class SearchHotelScreen extends StatefulWidget {
  @override
  _SearchHotelScreenState createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState extends State<SearchHotelScreen>
    with SingleTickerProviderStateMixin {
  // PublicService _publicService;
  StreamController checkInController;
  StreamController checkOutController;
  StreamController childrenStreamController;
  TextEditingController adultControlller = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController childrenControlller = TextEditingController();
  TextEditingController infatsControlller = TextEditingController();
  List<TextEditingController> ageController = [];
  final List<String> MONTHS = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  final List<String> DAYS = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  DateTime selectedDate = DateTime.now();
  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate;

  TabController tabController;
  String children;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adultControlller.text = "01";
    roomController.text = "01";
    childrenControlller.text = "0";
    infatsControlller.text = "0";
    tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    checkOutDate = selectedDate.add(Duration(days: 1));
    checkInController = new StreamController<bool>.broadcast();
    checkOutController = new StreamController<bool>.broadcast();
    childrenStreamController = new StreamController<bool>.broadcast();
    children = "0";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    // _publicService = context.watch();

    final body = ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
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
        SizedBox(
          height: 20,
        ),
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
                  StreamBuilder<bool>(
                      stream: checkInController.stream,
                      builder: (context, snapshot) {
                        return InkWell(
                          onTap: () {

                            _pickCheckInDate(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                checkInDate.day.toString(),
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
                                      MONTHS[checkInDate.month - 1]
                                              .toUpperCase() +
                                          " " +
                                          checkInDate.year.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      DAYS[checkInDate.weekday - 1],
                                      style: TextStyle(
                                          color: Color(0XFF828282),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })
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
                  StreamBuilder<bool>(
                    stream: checkOutController.stream,
                    builder: (context, snapshot) {
                      return InkWell(
                        onTap: (){
                          _pickCheckOutDate(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              checkOutDate.day.toString(),
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
                                    MONTHS[checkInDate.month - 1]
                                        .toUpperCase() +
                                        " " +
                                        checkInDate.year.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    DAYS[checkOutDate.weekday - 1],
                                    style: TextStyle(
                                        color: Color(0XFF828282),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 5),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.08,
                    // height:50,
                    height: MediaQuery.of(context).size.width * 0.14,

                    child: TextField(
                      controller: adultControlller,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          // fontSize: 25,
                          fontSize: MediaQuery.of(context).size.width * 0.075,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: Util.getDecorationForFilter("01"),
                    ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.08,
                    // height:50,
                    height: MediaQuery.of(context).size.width * 0.14,

                    child: StreamBuilder<bool>(
                        stream: childrenStreamController.stream,
                        builder: (context, snapshot) {
                          return InkWell(
                            onTap: () {
                              _displayTextInputDialog(context);
                            },
                            child: Text(
                              children,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }),
                    // TextField(
                    //   controller: childrenControlller,
                    //   textAlignVertical: TextAlignVertical.center,
                    //   keyboardType: TextInputType.number,
                    //   style: TextStyle(
                    //       // fontSize: 25,
                    //       fontSize: MediaQuery.of(context).size.width * 0.075,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w500),
                    //   decoration: Util.getDecorationForFilter("01"),
                    // ),
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
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width *0.08,
              //       // height:50,
              //       height:MediaQuery.of(context).size.width *0.14,
              //
              //       child: TextField(
              //         controller: infatsControlller,
              //         textAlignVertical: TextAlignVertical.center,
              //         keyboardType: TextInputType.number,
              //         style: TextStyle(
              //           // fontSize: 25,
              //             fontSize: MediaQuery.of(context).size.width *0.075,
              //             color: Colors.black,
              //             fontWeight: FontWeight.w500),
              //         decoration: Util.getDecorationForFilter("01"),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(bottom: 10),
              //       child: Text(
              //         "Infat",
              //         style: TextStyle(
              //             fontSize: 12,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.black),
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
        StreamBuilder<bool>(
            stream: childrenStreamController.stream,
            builder: (context, snapshot) {
              if (children == null ||
                  children.isEmpty ||
                  children == "" ||
                  children == "0")
                return Container(
                  width: 0,
                  height: 0,
                );
              else
                ageController.clear();
              return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: int.tryParse(children),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Child ${index + 1}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextField(
                            controller: getChildAgeController(index),
                            keyboardType: TextInputType.number,
                            decoration: Util.getFormDecoration("Child Age"),
                          ),
                        ],
                      ),
                    );
                  });
            }),
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
              // Row(
              //   children: [
              //     Text(
              //       "23",
              //       style: TextStyle(
              //           fontSize: 25,
              //           color: Colors.black,
              //           fontWeight: FontWeight.w500),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(bottom: 10),
              //       child: Text(
              //         "JULY 2021",
              //         style: TextStyle(
              //             fontSize: 12,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.black),
              //       ),
              //     )
              //   ],
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.08,
                    // height:50,
                    height: MediaQuery.of(context).size.width * 0.14,

                    child: TextField(
                      controller: roomController,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          // fontSize: 25,
                          fontSize: MediaQuery.of(context).size.width * 0.075,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: Util.getDecorationForFilter("01"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Room",
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
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: InkWell(
        onTap: () {
          // Util.popBack(context);

          Navigator.pushNamed(context, AppRoutes.APP_HOTELS);
        },
        child: Container(
          height: 55,
          margin: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
          decoration: Util.getPrimaryButtonDecoration(),
          child: Center(
            child: Text(
              "show result",
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
  @override
  void dispose() {
    checkOutController.close();
    checkInController.close();
    childrenStreamController.close();
    super.dispose();


  }
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Children'),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                children = value == "" ? "0" : value;
              },
              controller: childrenControlller,
              decoration: InputDecoration(hintText: "No Of Children"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    primary: Colors.red, backgroundColor: Colors.red),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  childrenStreamController.add(true);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    primary: Colors.green, backgroundColor: Colors.green),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  _pickCheckInDate(BuildContext context) {
    
    _selectDate(context, checkInDate, "checkin");
  }
  _pickCheckOutDate(BuildContext context) {

    _selectDate(context, checkOutDate, "checkout");
  }

  _selectDate(BuildContext context, DateTime initialDate, String type) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: selectedDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {

      if(type =="checkin"){
        checkInDate = picked;
        checkInController.sink.add(true);
      }else if(type =="checkout"){
        checkOutDate = picked;
        checkOutController.sink.add(true);
      }
    }
  }

  getChildAgeController(int index) {
    var age = TextEditingController();
    ageController.add(age);
    return age;
  }
}
