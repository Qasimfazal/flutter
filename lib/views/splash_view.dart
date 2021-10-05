import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Util.navigate(context, LoginScreen());
      // Navigator.of(context).pushAndRemoveUntil(
      //   // the new route
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => OptionScreen(),
      //   ),
      //   // this function should return true when we're done removing routes
      //   // but because we want to remove all other screens, we make it
      //   // always return false
      //       (Route route) => false,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SafeArea(
          child: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Image.asset(
                "assets/logo.png",
                height: 190,
                width: MediaQuery.of(context).size.width / 2,
              )),
        ),
      ),
    );
  }
}
