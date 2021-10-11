import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';

class HotelRoomBookedScreen extends StatefulWidget {
  @override
  _HotelRoomBookedScreenState createState() => _HotelRoomBookedScreenState();
}

class _HotelRoomBookedScreenState extends State<HotelRoomBookedScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "HOTEL ROOM BOOKED",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Manhattan Hotel",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  Text(
                    "\$456.00",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFFF9902)),
                  )
                ],
              ),
              Text(
                "City Park, Manhattan",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0XFF828282)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 140,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => Container(

                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)),
                            child: Image.asset(
                              "assets/img_13.png",
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
              ),
              Container(
                margin: EdgeInsets.only( top: 10),
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
                margin: EdgeInsets.only(top: 20),
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
                margin: EdgeInsets.only( bottom: 10),
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
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Booked By",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF828282),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF828282),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Gender",
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
                      "John Smith",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "25",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius:
                BorderRadius.all(Radius.circular(15)),
                child: Container(
                  width: double.infinity,
                  height: 130,
                  color: Color(0X1A000000),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(child: Text("Get Direction",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black),)))
            ],
          ),
        )
      ],
    );
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      body: body,
    );
  }
}
