import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LangaugeScreenState createState() => _LangaugeScreenState();
}

class _LangaugeScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      primary: true,
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Text(
            "SELECT LANGUAGE",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0X1A000000), spreadRadius: 0, blurRadius: 3),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Container(
                    width: 19,
                    height: 19,
                    decoration: BoxDecoration(shape: BoxShape.circle,gradient: Util.getPrimaryBtnGradient()),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 55,

          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
          decoration: Util.getPrimaryButtonDecoration(),
          child: Center(
            child: Text(
              "save",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
