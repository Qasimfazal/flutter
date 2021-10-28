

import 'package:flutter/cupertino.dart';

class PublicService extends ChangeNotifier
{
  bool redirect = false;

   changetheerror(bool a){
     redirect = a;
     notifyListeners();
   }
}