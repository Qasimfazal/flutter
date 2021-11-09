// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/model/event/EventResponse.dart';
import 'package:sould_food_guide/network/network_config.dart';
import 'package:sould_food_guide/network/network_endpoints.dart';

class Util {
  static getSignature() {
    int time = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
    var assemble = (NetworkConfig.HOTEL_API_KEY +
        NetworkConfig.HOTEL_SECRET +
        time.toString());
    var encoded = utf8.encode(assemble);
    return sha256.convert(encoded);
  }

  static getPrimaryButtonDecoration() {
    return BoxDecoration(
        gradient: getPrimaryBtnGradient(),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }

  static getSecondaryButtonDecoration() {
    return BoxDecoration(
        gradient: getPrimaryBtnGradient(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29), topRight: Radius.circular(29)));
  }

  static getPrimaryBtnGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0XFFFF9902), Color(0XFFFF3B14)]);
  }

  static getPrimaryGradientText() {
    return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0XFFFF9902), Color(0XFFFF3B14)])
        .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  }

  static getBack(context) {
    return InkWell(
        onTap: () {
          popBack(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.all(15),
              child: SvgPicture.asset("assets/ic_back.svg")),
        ));
  }

  static getDecoration(String hint) {
    return InputDecoration(
        hintText: '$hint',
        hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF1F1F1), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0))),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF1F1F1), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0))));
  }

  static getDecorationForFilter(String hint) {
    return InputDecoration(
      hintText: '$hint',
      hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
      enabledBorder: InputBorder.none,
      contentPadding: EdgeInsets.only(bottom: 15),

      // OutlineInputBorder(
      //     borderSide: BorderSide(color: Color(0xffF1F1F1), width: 1.0),
      //     borderRadius: BorderRadius.all(Radius.circular(0.0))),
      border: InputBorder.none,
      // border:OutlineInputBorder(
      //     borderSide: const BorderSide(color: Color(0xffF1F1F1), width: 0.5),
      //     borderRadius: BorderRadius.all(Radius.circular(0.0)))
    );
  }

  static getFormDecoration(String label) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(15),
      hintText: label,
      hintStyle: TextStyle(
          color: Color(0XFF9E9E9E), fontWeight: FontWeight.w400, fontSize: 12),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFF1F1F1), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFF1F1F1), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
    );
  }

  static getFormPasswordDecoration(String label, {Padding suffixIcon}) {
    return InputDecoration(
      labelText: label,
      suffixIcon: suffixIcon,
      labelStyle: TextStyle(
          color: Color(0XFFD3D3D3), fontWeight: FontWeight.w500, fontSize: 13),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF0F87C9), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF0F87C9), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  static navigate(context, screen) {
    Navigator.of(context).pushAndRemoveUntil(
      // the new route
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
      ),
      // this function should return true when we're done removing routes
      // but because we want to remove all other screens, we make it
      // always return false
      (Route route) => false,
    );
  }

  static open(context, screen) {
    Navigator.of(context).push(
      // the new route
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
      ),
      // this function should return true when we're done removing routes
      // but because we want to remove all other screens, we make it
      // always return false
    );
  }

  static popBack(context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  static getToolbar(BuildContext context, String title) {
    return AppBar(
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xFF222222)),
        title: Container(
          padding: EdgeInsets.all(10),
          height: kToolbarHeight,
          decoration: BoxDecoration(color: Color(0xFF222222)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/ic_menu.svg",
              ),
              Text(
                "$title",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  // Util.open(context, SearchScreen());
                },
                child: SvgPicture.asset(
                  "assets/ic_search.svg",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: true,
        leadingWidth: 0,
        // <-- Use this
        centerTitle: false,
        titleSpacing: 0);
  }

  static getSecondaryToolbar(BuildContext context, String title) {
    return AppBar(
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xFF222222)),
        title: Container(
          padding: EdgeInsets.all(10),
          height: kToolbarHeight,
          decoration: BoxDecoration(color: Color(0XFF222222)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    popBack(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  )),
              Text(
                '$title',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Icon(Icons.wb_sunny, color: Colors.transparent),
            ],
          ),
        ),
        automaticallyImplyLeading: true,
        leadingWidth: 0,
        // <-- Use this
        centerTitle: true,
        titleSpacing: 0);
  }

  static getHotelImagePath(String path) {
    var photo = NetworkEndpoints.BASE_HOTEL_IMAGE + path;
    return photo;
  }

  static getEventAddress(Events event) {
    if (event.eEmbedded == null ||
        event.eEmbedded.venues == null ||
        event.eEmbedded.venues.isEmpty) {
      return "";
    } else {
      var venue = event.eEmbedded.venues[0];
      return "${venue.address.line1} ${venue.city.name} ${venue.state.name} ${venue.country.name}";
    }
  }

  static getEventImage(Events event) {
    var images = event.images;
    images.sort((a,b)=>b.width.compareTo(a.width));
    var url =images.first.url;
    print("url $url");
    return url;
  }
//
//   static getProductSearchInput(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Util.open(context, SearchProductScreen());
//       },
//       child: Container(
//         padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top:10),
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/bg_splash.png"), fit: BoxFit.fitWidth)),
//         child: Container(
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(25.0))),
//           height: 50,
//
//           child: TextFormField(
//               decoration: InputDecoration(
//                   suffixIconConstraints:
//                   BoxConstraints(maxWidth: 35, maxHeight: 35),
//                   suffixIcon: Padding(
//                     padding: EdgeInsets.only(right: 20.0),
//                     child: Image.asset("assets/ic_search.png",
//                         fit: BoxFit.cover),
//                   ),
//                   contentPadding: EdgeInsets.only(left: 20.0),
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Search Products',
//                   hintStyle:
//                   TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide:
//                       BorderSide(color: Colors.white.withOpacity(0)),
//                       borderRadius:
//                       BorderRadius.all(Radius.circular(25.0))),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide:
//                       BorderSide(color: Colors.white.withOpacity(0)),
//                       borderRadius:
//                       BorderRadius.all(Radius.circular(25.0))),
//                   border: OutlineInputBorder(
//                       borderSide:
//                       BorderSide(color: Colors.white.withOpacity(0)),
//                       borderRadius:
//                       BorderRadius.all(Radius.circular(25.0))))),
//         ),
//       ),
//     );
//   }
//   static getProductSearch(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Util.open(context, SearchProductScreen());
//       },
//       child: Container(
//         padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top:10),
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/bg_splash.png"), fit: BoxFit.fitWidth)),
//         child: Container(
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(25.0))),
//           height: 50,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Search Products",
//                 style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0XFF9E9E9E)),
//               ),
//               Row(
//                 children: [
//                   VerticalDivider(
//                     thickness: 1,
//                     color: Color(0XFF959595),
//                   ),
//                   SizedBox(
//                     width: 17,
//                     height: 17,
//                     child: Image.asset("assets/ic_search.png", fit: BoxFit.cover),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // child: TextFormField(
//           //     decoration: InputDecoration(
//           //         suffixIconConstraints:
//           //         BoxConstraints(maxWidth: 35, maxHeight: 35),
//           //         suffixIcon: Padding(
//           //           padding: EdgeInsets.only(right: 20.0),
//           //           child: Image.asset("assets/ic_search.png",
//           //               fit: BoxFit.cover),
//           //         ),
//           //         contentPadding: EdgeInsets.only(left: 20.0),
//           //         filled: true,
//           //         fillColor: Colors.white,
//           //         hintText: 'Search Products',
//           //         hintStyle:
//           //         TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
//           //         focusedBorder: OutlineInputBorder(
//           //             borderSide:
//           //             BorderSide(color: Colors.white.withOpacity(0)),
//           //             borderRadius:
//           //             BorderRadius.all(Radius.circular(25.0))),
//           //         enabledBorder: OutlineInputBorder(
//           //             borderSide:
//           //             BorderSide(color: Colors.white.withOpacity(0)),
//           //             borderRadius:
//           //             BorderRadius.all(Radius.circular(25.0))),
//           //         border: OutlineInputBorder(
//           //             borderSide:
//           //             BorderSide(color: Colors.white.withOpacity(0)),
//           //             borderRadius:
//           //             BorderRadius.all(Radius.circular(25.0))))),
//         ),
//       ),
//     );
//   }
//
//   static getProductSearchWithFilter() {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/bg_splash.png"), fit: BoxFit.fitWidth)),
//       child: Row(
//         children: [
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(25.0))),
//               height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Search Products",
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0XFF9E9E9E)),
//                   ),
//                   Row(
//                     children: [
//                       VerticalDivider(
//                         thickness: 1,
//                         color: Color(0XFF959595),
//                       ),
//                       SizedBox(
//                         width: 17,
//                         height: 17,
//                         child: Image.asset("assets/ic_search.png",
//                             fit: BoxFit.cover),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               // child: TextFormField(
//               //     decoration: InputDecoration(
//               //         suffixIconConstraints:
//               //         BoxConstraints(maxWidth: 35, maxHeight: 35),
//               //         suffixIcon: Padding(
//               //           padding: EdgeInsets.only(right: 20.0),
//               //           child: Image.asset("assets/ic_search.png",
//               //               fit: BoxFit.cover),
//               //         ),
//               //         contentPadding: EdgeInsets.only(left: 20.0),
//               //         filled: true,
//               //         fillColor: Colors.white,
//               //         hintText: 'Search Products',
//               //         hintStyle:
//               //         TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
//               //         focusedBorder: OutlineInputBorder(
//               //             borderSide:
//               //             BorderSide(color: Colors.white.withOpacity(0)),
//               //             borderRadius:
//               //             BorderRadius.all(Radius.circular(25.0))),
//               //         enabledBorder: OutlineInputBorder(
//               //             borderSide:
//               //             BorderSide(color: Colors.white.withOpacity(0)),
//               //             borderRadius:
//               //             BorderRadius.all(Radius.circular(25.0))),
//               //         border: OutlineInputBorder(
//               //             borderSide:
//               //             BorderSide(color: Colors.white.withOpacity(0)),
//               //             borderRadius:
//               //             BorderRadius.all(Radius.circular(25.0))))),
//             ),
//           ),
// /*          Flexible(
//             child: Container(
//               height: 60,
//               child: TextFormField(
//                   decoration: InputDecoration(
//                       suffixIconConstraints:
//                           BoxConstraints(maxWidth: 35, maxHeight: 35),
//                       suffixIcon: Padding(
//                         padding: EdgeInsets.only(right: 20.0),
//                         child: Image.asset("assets/ic_search.png",
//                             fit: BoxFit.cover),
//                       ),
//                       contentPadding: EdgeInsets.only(left: 20.0),
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Search Products',
//                       hintStyle:
//                           TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white.withOpacity(0)),
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(25.0))),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white.withOpacity(0)),
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(25.0))),
//                       border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white.withOpacity(0)),
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(25.0))))),
//             ),
//           ),*/
//           Container(
//               margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//               child: SvgPicture.asset("assets/ic_filter.svg")),
//         ],
//       ),
//     );
//   }
//
//   static getHeadingViewAll(BuildContext context,String heading, double fontSize) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 '$heading',
//                 style:
//                     TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
//               ),
//               Spacer(),
//               InkWell(
//                 onTap: (){
//                   if(heading=="CATEGORIES"){
//                     open(context, CategoryScreen());
//                   }
//                 },
//                 child: Text(
//                   "VIEW ALL",
//                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//   static var catName = ['APPLIANCES','ELECTRONICS','JEWELRY & WATCHES','BEAUTY & HEALTH','APPLIANCES','ELECTRONICS','JEWELRY & WATCHES','BEAUTY & HEALTH'];
//   static  var catImage = ['appliances.png','electronics.png','beauty.png','jewelary.png','appliances.png','electronics.png','beauty.png','jewelary.png'];
//   static getCategoryItem(BuildContext context, int index) {
//     return InkWell(
//       onTap: () {
//         Util.open(context, ProductListingScreen());
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(7.0),
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Color(0XFFF2F2F2)),
//                 shape: BoxShape.circle,
//                 color: Color(0XFFF6F6F6)),
//             child: Image.asset(
//               "assets/"+catImage[index],
//               width: 20,
//               height: 20,
//             ),
//           ),
//           Center(
//             child: Text(
//               catName[index],
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}

/*********************/
//   static StreamController<bool> homeScreen= StreamController.broadcast();
//   static StreamController<bool> gameScreen= StreamController.broadcast();
//   static void hideKeyBoard(BuildContext context) {
//     FocusScope.of(context).requestFocus(FocusNode());
//   }
//
//   static String getShareGameString(Game game) {
//     return "Hi, check this game at,\nLocation: ${game.location}\non ${getGameDate(game.gameDate)} ${getGameTime(game.gameTime)}\n with description ${game.description}\n\nFor more details please visit ${Constants.website_URL}";
//   }
//
//   static String getGameDate(DateTime date) {
//     var newFormat = DateFormat("EEEE. MM/dd/yy");
//     return newFormat.format(date);
//   }
//
//   static String getGameTime(String time) {
//     DateTime parseDt = new DateFormat("HH:mm:ss").parse(time);
//     var newFormat = DateFormat("hh:mm a");
//     return newFormat.format(parseDt);
//   }
//
//   static void showLoader(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Container(
//           color: Colors.transparent,
//           width: 50,
//           height: 50,
//           child: new Center(
//             child: (Platform.isIOS)
//                 ? new CupertinoActivityIndicator(
//                     animating: true,
//                     radius: 35.0,
//                   )
//                 : new CircularProgressIndicator(
//                     valueColor:
//                         new AlwaysStoppedAnimation<Color>(Color(0xFFFFEC00)),
//                   ),
//           ),
//         );
//       },
//     );
//     new Future.delayed(new Duration(seconds: 5), () {});
//   }
//
//   static void hideLoader(BuildContext context) {
//     Navigator.pop(context);
//   }
//
//   static Widget showLoader1() {
//     return Container(
//       color: Colors.white,
//       width: 50,
//       height: 50,
//       child: new Center(
//         child: new CircularProgressIndicator(),
//       ),
//     );
//   }
//
//   static void navigateView(BuildContext context, Widget newScreen) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => newScreen,
//       ),
//     );
//   }
//
//   static void navigateViewWithPop(BuildContext context, Widget newScreen) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (_) => newScreen,
//       ),
//     );
//   }
//
//   static void pushAndRemoveUntil(BuildContext context, Widget newScreen) {
//     Navigator.of(context).pushAndRemoveUntil(
//       // the new route
//       MaterialPageRoute(
//         builder: (BuildContext context) => newScreen,
//       ),
//       // this function should return true when we're done removing routes
//       // but because we want to remove all other screens, we make it
//       // always return false
//       (Route route) => false,
//     );
//   }
//
//   static void popAndRemoveUntil(BuildContext context) {
//     Navigator.of(context).popUntil((route) => route.isFirst);
//   }
//
//   static String getDayWithIncrement(String date, int incrementDays) {
//     DateTime dateTime = new DateTime.now().add(Duration(days: incrementDays));
//     var x = DateTime.parse(date);
//     x = x.add(Duration(days: incrementDays));
//
//     DateFormat dateFormat = new DateFormat("yyyy-MM-dd");
//
//     return dateFormat.format(x);
//   }
//
//   static String getCurrentDate() {
//     DateTime dateTime = new DateTime.now();
//
//     DateFormat dateFormat = new DateFormat("yyyy-MM-dd");
//     return dateFormat.format(dateTime);
//   }
//
//   static String formatDate(String date) {
//     var dateParse = new DateFormat("dd-MMM-yyyy KK:mm a");
//     var dateDisplay = new DateFormat("KK:mm a");
//
//     return dateDisplay.format(dateParse.parse(date));
//   }
//
//   static String formatDate2(String date) {
//     var dateParse = new DateFormat("dd-MMM-yyyy KK:mm a");
//     var dateDisplay = new DateFormat("MMM dd, yyyy");
//
//     return dateDisplay.format(dateParse.parse(date));
//   }
//
//   static String formatDate3(String date) {
//     var dateParse = new DateFormat("dd-MMM-yyyy KK:mm a");
//     var dateDisplay = new DateFormat("dd-MM-yyyy");
//
//     return dateDisplay.format(dateParse.parse(date));
//   }
//
//   static void showToast(String msg) {
//     Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
//   }
//
//   static bool isValidEmailAddress(String emailAddress) {
//     return RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(emailAddress);
//   }
//
//   static String getTimesDifference(String time1, String time2) {
//     var timeParse = new DateFormat("dd-MMM-yyyy KK:mm a");
//     var timeDisplay = new DateFormat("KK:mm a");
//
//     var TIME_DIFFERENCE;
//
//     var TIME1 = timeParse.parse(time1);
//     var TIME2 = timeParse.parse(time2);
//
//     print("${TIME1}  ${TIME2}");
//
//     if (TIME2.isAfter(TIME1)) {
//       TIME_DIFFERENCE = TIME2.difference(TIME1).inMinutes;
//
//       return TIME_DIFFERENCE.toString();
//     }
//
//     return "null";
//   }
// }
