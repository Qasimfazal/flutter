import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Container(
          color: Color(0XFFF5F5F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Util.getBack(context),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "We're Happy to hear form you !!",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Let us know queries & feedback",
                  style: TextStyle(
                      color: Color(0XFF828282),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0XFFF5F5F5),
                            border:
                                Border.all(color: Color(0xFFFF9902), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        // color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/ic_call.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "call us",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFFFF7E07)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: Util.getPrimaryBtnGradient()),
                        // color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/ic_mail.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Mail us",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
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
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Text(
            "Or Send Your Message",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Text(
            "Full Name",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0XFF707070)),
          ),
        ),
        Container(
          height: 45,
          width: double.infinity,
          // padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0X1A000000), spreadRadius: 0, blurRadius: 6),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: TextField(
            controller: TextEditingController(text: "John Smith"),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Text(
            "Contact Number",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0XFF707070)),
          ),
        ),
        Container(
          height: 45,
          width: double.infinity,
          // padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0X1A000000), spreadRadius: 0, blurRadius: 6),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: TextField(
            controller: TextEditingController(text: "+123 456 7890"),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Text(
            "Your Message",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0XFF707070)),
          ),
        ),
        Container(

          width: double.infinity,
          // padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 15, right: 15, top: 10,bottom: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0X1A000000), spreadRadius: 0, blurRadius: 6),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: TextField(
            keyboardType: TextInputType.multiline,
minLines: 4,
            maxLines: null,
            // controller: TextEditingController(text: "+123 456 7890"),
            decoration: InputDecoration(
              hintText: "Write Your Message",
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black) ,
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
          ),
        ),
        InkWell(
          onTap: () {
            // Util.open(context, MainScreen());
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "submit now",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
    );
  }
}
