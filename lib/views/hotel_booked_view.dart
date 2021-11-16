import 'package:flutter/material.dart';
import 'package:sould_food_guide/core/public_service.dart';
import 'package:sould_food_guide/model/hotels/booking/HotelBookingResponse.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:provider/src/provider.dart';
class HotelRoomBookedScreen extends StatefulWidget {
  final Booking booking;
  HotelRoomBookedScreen(this.booking);

  @override
  _HotelRoomBookedScreenState createState() => _HotelRoomBookedScreenState();
}

class _HotelRoomBookedScreenState extends State<HotelRoomBookedScreen> {
  PublicService publicService;

  @override
  Widget build(BuildContext context) {
    publicService = context.watch();
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
                  Expanded(
                    child: Text(
                      "${publicService.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    "${publicService.currency} ${publicService.rate}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFFF9902)),
                  )
                ],
              ),
              Text(
                "${publicService.address}",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0XFF828282)),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   height: 140,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 4,
              //       itemBuilder: (context, index) => Container(
              //
              //             width: MediaQuery.of(context).size.width * 0.7,
              //             margin: EdgeInsets.only(right: 10),
              //             child: ClipRRect(
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(25)),
              //               child: Image.asset(
              //                 "assets/img_13.png",
              //                 height: 140,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           )),
              // ),
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
                      widget.booking.hotel.checkIn,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.booking.hotel.checkOut,
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
                      widget.booking.hotel.rooms[0].code,
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
                    // Text(
                    //   "Age",
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       color: Color(0XFF828282),
                    //       fontWeight: FontWeight.w400),
                    // ),
                    // Text(
                    //   "Gender",
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       color: Color(0XFF828282),
                    //       fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.booking.holder.name} ${widget.booking.holder.surname} ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    // Text(
                    //   "25",
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w600),
                    // ),
                    // Text(
                    //   "Male",
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w600),
                    // ),
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
