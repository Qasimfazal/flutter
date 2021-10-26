import 'dart:async';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/main_view.dart';
import 'package:sould_food_guide/views/signup/signup_viewmodel.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupViewModel _signupViewModel;
  StreamController _signupController;
  bool _showLoader = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _signupController = new StreamController<bool>.broadcast();
    _signupController.sink.add(false);
    _signupViewModel = new SignupViewModel(App());
    observeViewModel();
  }

  void observeViewModel() {
    _signupViewModel
        .getUserRepository()
        .getRepositoryResponse()
        .listen((response) {
      // print("response code " + response.code.toString());

      if (mounted)
        setState(() {
          _showLoader = false;
        });
      if (response.code == null) {
        if (response.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.APP_ROUTE_LOGIN, (route) => false);
        } else {
          ToastUtil.showToast(context, response.msg,
              toastGravity: ToastGravity.CENTER);
        }
      } else {
        ToastUtil.showToast(context, response.msg);
      }

      // print(response);
    });
  }

  void callLoginApi() {
    if (nameController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Name can't be blank.");
      return;
    }
    if (emailController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Email can't be blank.");
      return;
    }
    if (phoneController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Phone can't be blank.");
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Password can't be blank.");
      return;
    }

    if (mounted)
      setState(() {
        _showLoader = true;
      });

    _signupViewModel.signup(
        nameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "Create Account".toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
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
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: Util.getFormDecoration("Full Name"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: Util.getFormDecoration("Email Address"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: Util.getFormDecoration("Phone Number"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Password"),
          ),
        ),
        InkWell(
          onTap: () {
            Util.open(context, MainScreen());
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "sign up".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Util.popBack(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
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
      body: SafeArea(child: ModalProgressHUD(inAsyncCall: _showLoader,child: body)),
    );
  }

  @override
  void dispose() {
    print("login dispose");
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
