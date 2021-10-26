import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void   showToast(BuildContext context, String msg,
      {ToastGravity toastGravity = ToastGravity.BOTTOM}) {
    print("msg " + msg);

    if (msg == null) {
      return;
    }
    Fluttertoast.showToast(msg: msg, gravity: toastGravity);
    // Toast.show(msg, context,
    //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  static void showLongToast(BuildContext context, String msg,
      {ToastGravity toastGravity = ToastGravity.BOTTOM}) {
    print("msg " + msg);

    if (msg == null) {
      return;
    }
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, gravity: toastGravity);
    // Toast.show(msg, context,
    //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }


  static void showSnackBar(BuildContext context,String msg){

    final snackBar = SnackBar(content: Text(msg!=null?msg:""));
    ScaffoldState().showSnackBar(snackBar);


  }
}
