import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sould_food_guide/views/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0XFFFF9902),
  ));
  runApp(MaterialApp(
    home: SplashScreen(),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

