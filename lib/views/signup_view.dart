import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/util/Util.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "Create Account",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image: AssetImage("assets/img_1.png"),
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      child: InkWell(onTap: () {}),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: Util.getPrimaryBtnGradient(),
                      ),
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset("assets/ic_camera.svg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: Util.getFormDecoration("Full Name"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: Util.getFormDecoration("Email Address"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: Util.getFormDecoration("Phone Number"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Password"),
          ),
        ),
        Container(
          height: 55,
          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
          decoration: Util.getPrimaryButtonDecoration(),
          child: Center(
            child: Text(
              "sign up",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Util.popBack(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10,top:20),
            child: Center(
              child: Text.rich(TextSpan(
                  text: "Already Have an Account? ",
                  style: TextStyle(
                      color: Color(0XFF9E9E9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Color(0XFFFF8106),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))
                  ])),
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
}
