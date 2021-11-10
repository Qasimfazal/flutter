import 'dart:async';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/code_verification.dart';
import 'package:sould_food_guide/views/reset_password/reset_viewmodel.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ResetViewModel _resetViewModel;
  StreamController _resetController;
  bool _showLoader = false;
  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _resetController = new StreamController<bool>.broadcast();
    _resetViewModel = new ResetViewModel(App());
    observeViewModel();
  }
  @override
  void dispose() {

    super.dispose();
  }
  void observeViewModel(){
    _resetViewModel.getResetRepository().getRepositoryResponse().listen((response) {
      if (mounted)
        setState(() {
          _showLoader = false;
        });
      if (response.code == null) {
        if (response.success) {
          ToastUtil.showToast(context, response.msg,
              toastGravity: ToastGravity.CENTER);
          Navigator.pushNamed(context, AppRoutes.APP_RESET_PASSWORD);
        } else {
          ToastUtil.showToast(context, response.msg,
              toastGravity: ToastGravity.CENTER);
        }
      } else {
        ToastUtil.showToast(context, response.msg);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "Forgot password".toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 5),
          child: Text(
            "Enter Your Email Address",
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
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: Util.getFormDecoration("Enter Email Address"),
          ),
        ),
        InkWell(
          onTap: () {
            callForgotApi();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "continue".toUpperCase(),
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Util.popBack(context);
          },
          child: Center(
            child: Text.rich(TextSpan(
                text: "Don't Forgot Password? ",
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
      body: SafeArea(child: ModalProgressHUD(inAsyncCall:_showLoader,child: body)),
    );
  }

  void callForgotApi() {

    if(emailController.text.trim().isEmpty){
      ToastUtil.showToast(context, "Email can't be blank.");
      return;
    }
    if (mounted)
      setState(() {
        _showLoader = true;
      });

    _resetViewModel.forgot(
        emailController.text.trim(),);
  }
}
