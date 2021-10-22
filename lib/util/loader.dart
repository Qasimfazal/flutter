import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  bool isLoading;
  Color color;
  Loader({this.isLoading,this.color});


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color??Color(0xff52D15D)),
        ))
        : Container(
      width: 0,
      height: 0,
    );
  }
}