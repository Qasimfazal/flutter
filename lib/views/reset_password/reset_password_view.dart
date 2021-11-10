import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/reset_password/reset_viewmodel.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetViewModel _resetViewModel;
  bool _showLoader = false;
  final codeController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  BuildContext context;

  @override
  void initState() {
    super.initState();
    _resetViewModel = new ResetViewModel(App());
    observeViewModel();
  }

  void observeViewModel() {
    _resetViewModel
        .getResetRepository()
        .getRepositoryResponse()
        .listen((response) {
      if (mounted)
        setState(() {
          _showLoader = false;
        });
      if (response.code == null) {
        if (response.success) {
          ToastUtil.showToast(context, response.msg,
              toastGravity: ToastGravity.CENTER);
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.APP_ROUTE_LOGIN, (route) => false);
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
    this.context= context;
    final body = ListView(
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
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration:
                Util.getFormDecoration("Enter Your 6-Digit Confirmation Code"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            obscureText: true,
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Enter New Password"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            obscureText: true,
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Enter Confirm Password"),
          ),
        ),
        InkWell(
          onTap: () {
            callResetPasswordApi();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "reset password".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
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
      body: SafeArea(
          child: ModalProgressHUD(inAsyncCall: _showLoader, child: body)),
    );
  }

  void callResetPasswordApi() {
    if (codeController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Code can't be blank.");
      return;
    }
    if (newPasswordController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "New Password can't be blank.");
      return;
    }
    if (confirmPasswordController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Confirm Password can't be blank.");
      return;
    }
    if (mounted)
      setState(() {
        _showLoader = true;
      });

    _resetViewModel.resetPassword(
      codeController.text.trim(),
      newPasswordController.text.trim(),
      confirmPasswordController.text.trim(),
    );
  }
}
