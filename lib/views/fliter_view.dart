import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _currentSliderValue = 200;

  @override
  Widget build(BuildContext context) {
    final body = ListView(
      primary: true,
      shrinkWrap: true,
      children: [
        Util.getBack(context),
        Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "SHORT & FILTER",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            )),
        Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "SHORT BY",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 25, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0X0D000000),
                          spreadRadius: 0,
                          blurRadius: 3),
                    ],
                    color: Colors.white,
                    border: Border.all(color: Color(0XFFF1F1F1), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text("Price",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()
                            ..shader = Util.getPrimaryGradientText())),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 25, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0X0D000000),
                          spreadRadius: 0,
                          blurRadius: 3),
                    ],
                    color: Colors.white,
                    border: Border.all(color: Color(0XFFF1F1F1), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text("Dept. time",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()
                            ..shader = Util.getPrimaryGradientText())),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 25, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0X0D000000),
                          spreadRadius: 0,
                          blurRadius: 3),
                    ],
                    color: Colors.white,
                    border: Border.all(color: Color(0XFFF1F1F1), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text("Arrv. Time",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()
                            ..shader = Util.getPrimaryGradientText())),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            "RANGE TO",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: SliderTheme(
            data: SliderThemeData(
                activeTrackColor: Color(0XFFFF9902),
                thumbColor: Color(0XFFFF3B14),
                inactiveTrackColor: Color(0XFFECECEC)),
            child: Slider(
              max: 1000.0,
              min: 100.0,
              value: _currentSliderValue,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ 100",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    foreground: Paint()
                      ..shader = Util.getPrimaryGradientText()),
              ),
              Text(
                "\$ 1000",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    foreground: Paint()
                      ..shader = Util.getPrimaryGradientText()),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            "DEPARTURE TIME",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            primary: false,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0X0D000000),
                        spreadRadius: 0,
                        blurRadius: 3),
                  ],
                  color: Colors.white,
                  border: Border.all(color: Color(0X0D000000), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/ic_night.svg"),
                      Text(
                        "Mind Night",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    "00:00 - 04:59",
                    style: TextStyle(
                        color: Color(0XFF828282),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10);
            },
          ),
        ),

        //
        Container(
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            "ARRIVAL TIME",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            primary: false,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0X0D000000),
                        spreadRadius: 0,
                        blurRadius: 3),
                  ],
                  color: Colors.white,
                  border: Border.all(color: Color(0X0D000000), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/ic_night.svg"),
                      Text(
                        "Mind Night",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    "00:00 - 04:59",
                    style: TextStyle(
                        color: Color(0XFF828282),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 10,
              );
            },
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: body),
    );
  }
}
