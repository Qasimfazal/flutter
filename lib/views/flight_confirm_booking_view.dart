import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/checkout_view.dart';

class FlightConfirmBookingScreen extends StatefulWidget {
  @override
  _FlightConfirmBookingScreenState createState() =>
      _FlightConfirmBookingScreenState();
}

class _FlightConfirmBookingScreenState
    extends State<FlightConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
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
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                width: 54,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFFF5F5F5),
                ),
                height: 54,
                child: Center(
                  child: Image.asset("assets/img_5.png",
                      fit: BoxFit.scaleDown, width: 36, height: 14),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "American Airlines",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  Text(
                    "AA-1264",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Color(0XFF828282)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Text(
            "Departure From",
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
            "HOU - HOUSTON, USA",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Text(
            "Arrival",
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
            "MHK - Houston, USA",
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
                "Departure",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFF828282),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Arrival",
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
                "23 Jun, 12:35 am",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "24 Jun, 12:35 am",
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
                "02",
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
                      "\$ 100.00",
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
                      "\$ 10.00",
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
                      "\$ 5.00",
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
                      "\$ 175.00",
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
