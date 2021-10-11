import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/hotel_booked_view.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "CHECKOUT",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            "Select Payment Method",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 93,
                height: 68,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  shadowColor: Color(0XFFF1F1F1),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ic_payu.png",
                        width: 45,
                        height: 23,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        "PayU Money",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 113,
                height: 68,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  shadowColor: Color(0XFFF1F1F1),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ic_credit_card.png",
                        width: 45,
                        height: 23,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        "Credit Card",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 93,
                height: 68,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  shadowColor: Color(0XFFF1F1F1),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ic_paypal.png",
                        width: 45,
                        height: 23,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        "Paypal",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            "Card Details",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0X1A000000), spreadRadius: 0, blurRadius: 6),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name On Card",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF707070)),
              ),
              Text(
                "John Smith",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0X1A000000), spreadRadius: 0, blurRadius: 6),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Card Number",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF707070)),
              ),
              Text(
                "1234 5678 9012 3456",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0X1A000000),
                            spreadRadius: 0,
                            blurRadius: 6),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Expire",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF707070)),
                      ),

                      Text(
                        "10/02/2024",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0X1A000000),
                            spreadRadius: 0,
                            blurRadius: 6),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CVV",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF707070)),
                      ),
                      Text(
                        "1345",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        onTap: () {
          Util.open(context, HotelRoomBookedScreen());

        },
        child: Container(
          height: 55,
          margin: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 15),
          decoration: Util.getPrimaryButtonDecoration(),
          child: Center(
            child: Text(
              "pay \$175.00",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
