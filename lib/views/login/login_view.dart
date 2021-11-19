import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/signup/signup_view.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../app/app.dart';
import '../../app/app_routes.dart';
import '../../util/ToastUtil.dart';
import 'login_viewmodel.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel _loginViewModel;
  StreamController _loginController;
  bool _showLoader = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  BuildContext context;

  void listenGoogleSignIn() {
    _googleSignIn.onCurrentUserChanged.listen((googleSignInAccount) {
      _showLoader = false;
      // controlSignIn(googleSignInAccount);
      print(
          "Name: ${googleSignInAccount.displayName}\nEmail:${googleSignInAccount.email}\nPic: ${googleSignInAccount.photoUrl}\nID: ${googleSignInAccount.id}");
      // this.checkSocialLogin(account: googleSignInAccount, isGoogle: true);
    }, onError: (googleError) {
      print("Google Error: $googleError");
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Error Google'),
                content: Text('Error ${googleError}'),
              ));
    });
  }


  void googleSignIn() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      // controlSignIn(googleSignInAccount);
      if (googleSignInAccount != null) {
        googleSignInAccount.authentication.then(
            (GoogleSignInAuthentication authentication) {
              print("google access token ${authentication.accessToken}");
              callLoginWithGoogleApi(authentication.accessToken);
            }
                );
        print(
            "Name: ${googleSignInAccount.displayName}\nEmail:${googleSignInAccount.email}\nPic: ${googleSignInAccount.photoUrl}\nID: ${googleSignInAccount.id}");

      } else {
        print("account is null");
        ToastUtil.showToast(context, "Unable to get account detail");
      }

      // this.checkSocialLogin(account: googleSignInAccount, isGoogle: true);
    } on PlatformException catch (e) {
      // User not signed in yet. Do something appropriate.
      print("The user is not signed in yet. Asking to sign in. ${e.message}");
      ToastUtil.showToast(context, e.message);
      // _googleSignIn.signIn();
    } on Exception catch (e) {
      print(e.toString());
      ToastUtil.showToast(context, e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    // this.listenGoogleSignIn();
    _loginController = new StreamController<bool>.broadcast();
    _loginController.sink.add(false);
    _loginViewModel = new LoginViewModel(App());
    observeViewModel();
  }

  void observeViewModel() {
    _loginViewModel
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
              context, AppRoutes.APP_MAIN_SCREEN, (route) => false);
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
    if (emailController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Email can't be blank.");
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

    _loginViewModel.login(emailController.text.trim(), passwordController.text);
  }

  void callLoginWithGoogleApi(String accessToken){
    if (mounted)
      setState(() {
        _showLoader = true;
      });
    _loginViewModel.googleLogin(accessToken);
  }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("My amazing message! O.o")));
    final body = ListView(
      shrinkWrap: true,
      children: [
        // Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Text(
            "welcome to soul food guid".toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 5),
          child: Text(
            "Add Your Details to Sign In",
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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: Util.getFormDecoration("Email Address"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: Util.getFormDecoration("Password"),
          ),
        ),
        InkWell(
          onTap: () {
            callLoginApi();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "login now".toUpperCase(),
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
            Navigator.pushNamed(context, AppRoutes.APP_FORGOT);
          },
          child: Center(
            child: Text.rich(TextSpan(
                text: "Forgot Password? ",
                style: TextStyle(
                    color: Color(0XFF9E9E9E),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: "Click Here",
                      style: TextStyle(
                          color: Color(0XFFFF8106),
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ])),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                "OR",
                style: TextStyle(
                    color: Color(0XFFFF8106),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )),
        Center(
            child: Text("Continue With Social Media",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500))),
        InkWell(
          onTap: () async {
            FacebookAuth.instance.login(permissions: [
              'public_profile',
              'email',
            ]).then((value) {
              FacebookAuth.instance.getUserData().then((userData) {
                print("userData -> $userData");
              }).onError((error, stackTrace) {
                print("error inner  -> ${error.toString()}");
              });
            }).onError((error, stackTrace) {
              print(stackTrace.toString());
              print("error outer -> ${error.message}");
            });
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: BoxDecoration(
                color: Color(0XFF3B5998),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/ic_fb.svg"),
                Text(
                  " | LOGIN WITH FACEBOOK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // _showLoader= true;
            // _googleSignIn =GoogleSignIn();
            if(Platform.isAndroid)
            googleSignIn();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
                color: Color(0XFFF63324),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/ic_google.svg"),
                Text(
                  " | Login With Google+".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Util.open(context, SignupScreen());
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text.rich(TextSpan(
                  text: "Don't Have an Account? ",
                  style: TextStyle(
                      color: Color(0XFF9E9E9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "Sign Up",
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
      body: ModalProgressHUD(
          inAsyncCall: _showLoader, child: SafeArea(child: body)),
    );
  }

  @override
  void dispose() {
    print("login dispose");
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
