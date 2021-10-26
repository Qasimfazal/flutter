import 'package:flutter/material.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      await App().getAppPreferences().isPreferenceReady;
      await App().getAppPreferences().getUserToken().then((token) {
        Navigator.pushNamedAndRemoveUntil(
            context,
            token == null ? AppRoutes.APP_ROUTE_LOGIN : AppRoutes.APP_MAIN_SCREEN,
            (route) => false);
      });
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
