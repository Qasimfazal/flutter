import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/about_view.dart';
import 'package:sould_food_guide/views/langauge_view.dart';
import 'package:sould_food_guide/views/review_view.dart';
import 'package:sould_food_guide/views/support_view.dart';
import 'package:sould_food_guide/views/terms_view.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Container(
          width: double.infinity,
          color: Color(0XFFF5F5F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Text(
                  "USER ACCOUNT",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: Ink.image(
                            image: AssetImage("assets/img_4.png"),
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            child: InkWell(onTap: () {}),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Smith",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          "View Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF828282),
                              fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: (){
Util.open(context, SupportScreen());
          },
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset("assets/ic_support.svg")),
                Text(
                  "Support",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Util.open(context, AboutScreen());
          },
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset("assets/ic_about.svg")),
                Text(
                  "About Us",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Util.open(context, TermsScreen());

          },
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset("assets/ic_terms.svg")),
                Text(
                  "Terms & Conditions",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        InkWell(onTap: (){
          Util.open(context, ReviewScreen());
        },

          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset("assets/ic_review.svg")),
                Text(
                  "My Reviews",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        // InkWell(
        //   onTap: (){
        //     Util.open(context, LanguageScreen());
        //   },
        //   child: Container(
        //     margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
        //     child: Row(
        //       children: [
        //         Container(
        //             margin: EdgeInsets.only(right: 10),
        //             child: SvgPicture.asset("assets/ic_language.svg")),
        //         Text(
        //           "Change Language",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w600,
        //               color: Colors.black,
        //               fontSize: 16),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset("assets/ic_share.svg")),
              Text(
                "Share App",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset("assets/ic_rate.svg")),
              Text(
                "Rate App",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16),
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

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
