import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "Reset Password".toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 5),
          child: Text(
            "The Password Should Have Atleast 6 Character",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0XFF9E9E9E)),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Enter New Password"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Enter Confirm Password"),
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "reset password".toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Util.popBack(context);
          },
          child: Center(
            child: Text.rich(TextSpan(
                text: "Don't Reset Password? ",
                style: TextStyle(
                    color: Color(0XFF9E9E9E),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: "Cancel",
                      style: TextStyle(
                          color: Color(0XFFFF8106),
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ])),
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
