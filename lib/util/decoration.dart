import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecorationBox {
  static BoxDecoration decorationBackgroundGreen() {
    return BoxDecoration(
      color: Color(0xff1fb739),
      border: Border.all(
        width: 2.00,
        color: Color(0xff1cb636),
      ),
      borderRadius: BorderRadius.circular(50.00),
    );
  }

  static BoxDecoration decorationBackgroundGreenWithMinSquare() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff52D15D),
              Color(0xff1FB838)
            ]
        ),
        color: Color(0xff1fb739),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
        topLeft: Radius.circular(10.0),

        ));
  }

  static BoxDecoration decorationBackgroundGreenWithMaxSquare() {
    return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff52D15D), Color(0xff1FB838)],
        ),
        color: Color(0xff1fb739),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(10.0),
        //   bottomRight: Radius.circular(10.0),
        //
        // )
    );
  }

  static BoxDecoration decorationBackgroundGreenWithBottomRounded() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff52D15D), Color(0xff1FB838)],
      ),
      color: Color(0xff1fb739),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
      )
    );
  }

  static BoxDecoration decorationBackgroundLightWithMaxSquare() {
    return BoxDecoration(
        color: Color(0xffF4FEF6),
        border: Border.all(
          width: 2.00,
          color: Color(0xffF4FEF6),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),

        ));
  }

  static BoxDecoration decorationBorderGreen() {
    return BoxDecoration(
      color: Color(0xffffffff),
      border: Border.all(
        width: 1.00,
        color: Color(0xff1cb636),
      ),
      borderRadius: BorderRadius.circular(50.00),
    );
  }

  static BoxDecoration decorationBorderGreenWithTransparentBackground() {
    return BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        width: 1.00,
        color: Color(0xff1cb636),
      ),
      borderRadius: BorderRadius.circular(50.00),
    );
  }

  static BoxDecoration decoration() {
    return BoxDecoration(
      color: Color(0xffffffff),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.00, 0.00),
          color: Color(0xff000000).withOpacity(0.16),
          blurRadius: 8,
        ),
      ],
      borderRadius: BorderRadius.circular(15.00),
    );
  }

  static BoxDecoration decorationWithRoundBorder() {
    return BoxDecoration(
      color: Color(0xffffffff),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          //offset: Offset(0.00, 0.00),
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 1,
        ),
      ],
      //borderRadius: BorderRadius.circular(50.00),
    );
  }

  // static InputDecoration decorationRound(String title, String icon) {
  //   return InputDecoration(
  //     prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
  //     prefixIcon: Image.asset(icon),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(32.0),
  //       borderSide:
  //           const BorderSide(color: const Color(0xffF2F7F3), width: 1.0),
  //     ),
  //     hintText: title,
  //     hintStyle: TextStyle(
  //         fontSize: getProportionateScreenWidth(10),
  //         fontFamily: 'Helvetica',
  //         color: const Color(0xff444444)),
  //     contentPadding: const EdgeInsets.only(left: 100),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(32.0),
  //       borderSide:
  //           const BorderSide(color: const Color(0xffF2F7F3), width: 1.0),
  //     ),
  //   );
  // }

  static BoxDecoration decorationBackgroundYellow() {
    return BoxDecoration(
      color: Color(0xffF4AE00),
      border: Border.all(
        width: 2.00,
        color: Color(0xffF4AE00),
      ),
      borderRadius: BorderRadius.circular(20.00),
    );
  }

  static BoxDecoration decorationBackgroundYellowRoundBorders() {
    return BoxDecoration(
      color: Color(0xffF4AE00),
      border: Border.all(
        width: 2.00,
        color: Color(0xffF4AE00),
      ),
      borderRadius: BorderRadius.circular(50.00),
    );
  }

  static BoxDecoration decorationBackgroundWhiteWithMinSquare() {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Color(0xffFFFFF),
        border: Border.all(
          width: 2.00,
          color: Color(0xffFFFFF),
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),

        ));
  }

  static BoxDecoration decorationSquare() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(15.00),
    );
  }

  static BoxDecoration decorationSquareWithOutShadow() {
    return BoxDecoration(
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(25.00),
    );
  }

  static BoxDecoration decorationSquareWithOutShadowAndBackground() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          //spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(25.00),
    );
  }

  static BoxDecoration decorationSquareWithOutShadowAndBackgroundWithMinRadius() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          //spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  static BoxDecoration decorationSquareWithOutShadowAndBackgroundWithNormalRadius() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          //spreadRadius: 2,
          blurRadius: 2,
          // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(25.00),
    );
  }

  static BoxDecoration decorationSquareWithShadowAndBackground() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(25.00),
    );
  }

  static BoxDecoration decorationSquareWithShadow() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          //spreadRadius: 5,
          blurRadius: 12,
          //offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  static BoxDecoration decorationSquareWithShadowWithFullRadius() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          //spreadRadius: 5,
          blurRadius: 12,
          //offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(50.00),
    );
  }

  static BoxDecoration decorationSquareWithoutShadowWithNormalRadius() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          //spreadRadius: 5,
          blurRadius: 3,
          //offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(8.00),
    );
  }

  static BoxDecoration decorationSquareWithShadowWithNormalRadius() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(15.00),
    );
  }

  static BoxDecoration decorationSquareWithShadowWithMinRadius() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 3,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  static BoxDecoration decorationGray() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(15.00),
    );
  }
  
  // static BoxDecoration decorationGreen() {
  //   return BoxDecoration(
  //     boxShadow: [
  //       BoxShadow(
  //         color: Colors.grey.withOpacity(0.1),
  //         spreadRadius: 5,
  //         blurRadius: 7,
  //         offset: Offset(0, 3), // changes position of shadow
  //       ),
  //     ],
  //     color: Color(0xffF4FEF6),
  //     border: Border.all(
  //       width: 1.00,
  //       color: AppColors.APP_PRIMARY_COLOR,
  //     ),
  //     borderRadius: BorderRadius.circular(15.00),
  //   );
  // }

  // static BoxDecoration decorationLightGreen() {
  //   return BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       color: AppColors.LIGHT_GREEN_COLOR
  //   );
  // }

  static BoxDecoration decorationSquareWithLowOpacity() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400.withOpacity(0.1),
          blurRadius: 1,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 1.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(15.00),
    );
  }

  // static BoxDecoration decorationButtonWithGradient(){
  //   // return BoxDecoration(
  //   //   borderRadius: BorderRadius.circular(25),
  //   //   gradient: LinearGradient(
  //   //   begin: Alignment.topRight,
  //   //   end: Alignment.bottomLeft,
  //   //   colors: [Color(0xff52D15D),Color(0xff1FB838)])
  //   // );
  //   return BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       color: AppColors.APP_PRIMARY_COLOR
  //   );
  // }

  static BoxDecoration decorationButtonGradientWithoutRadius(){
    return BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          colors: [Color(0xff52D15D), Color(0xff1FB838)],
        ),
    );
  }

  static BoxDecoration decorationButtonGradientWithoutRadiusForDrawer(){
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [Color(0xff52D15D), Color(0xff1FB838)],
      ),
    );
  }

  static BoxDecoration decorationButtonWithGreen(){
    return BoxDecoration(
      color: Color(0xff01d318),
      borderRadius: BorderRadius.circular(25.00),
    );
  }

  static BoxDecoration decorationButtonWithRed(){
    return BoxDecoration(
      color: Color(0xfff42f2f),
      borderRadius: BorderRadius.circular(25.00),
    );
  }

  static BoxDecoration inputBoxDecoration(){
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Color(0xffFFFFFF),
      border: Border.all(
        width: 2.00,
        color: Color(0xffFFFFFF),
      ),
      borderRadius: BorderRadius.circular(10.00),
    );
  }
}
