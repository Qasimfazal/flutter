import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sould_food_guide/views/splash_view.dart';

import 'app/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0XFFFF9902),
  ));
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:App(),
    );

  }
}

