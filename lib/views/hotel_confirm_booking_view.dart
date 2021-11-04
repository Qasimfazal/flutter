import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sould_food_guide/core/public_service.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/checkout_view.dart';

class HotelConfirmBookingScreen extends StatefulWidget {
  @override
  _HotelConfirmBookingScreenState createState() =>
      _HotelConfirmBookingScreenState();
}

class _HotelConfirmBookingScreenState extends State<HotelConfirmBookingScreen> {
  PublicService publicService;
  @override
  Widget build(BuildContext context) {
    publicService = context.watch();
    final body = ListView(
      primary: true,
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "Confirm booking".toUpperCase(),
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Text(
            "Address",
            style: TextStyle(
                fontSize: 14,
                color: Color(0XFF828282),
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            "${publicService.address ?? "NA"}",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Check-In",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFF828282),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Check-Out",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFF828282),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${publicService.checkIn ?? "NA"}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${publicService.checkOut ?? "NA"}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Room Num",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFF828282),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Total Guest",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFF828282),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "B112",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${publicService.guests ?? "NA"}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Color(0XFFF5F5F5),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text(
                  "Payment info".toUpperCase(),
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fare Charges",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${publicService.currency} ${publicService.rate}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Convenience Charges",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${publicService.currency} 10.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cancelletion Charges",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${publicService.currency} 5.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 5),
                height: 2,
                width: double.infinity,
                color: Color(0XFFE5E5E5),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Charges",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${publicService.currency} ${publicService.rate}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Util.open(context, CheckoutScreen());
                },
                child: Container(
                  height: 55,
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                  decoration: Util.getPrimaryButtonDecoration(),
                  child: Center(
                    child: Text(
                      "continue to pay".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
