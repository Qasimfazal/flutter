import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/model/event/EventResponse.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/flight_confirm_booking_view.dart';
import 'package:sould_food_guide/views/hotel_confirm_booking_view.dart';

class EventDetailScreen extends StatefulWidget {
  final arguments;

  EventDetailScreen(this.arguments);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  Events event;
  String imagePath;

  int priceValue;

  @override
  void initState() {
    super.initState();
    if (widget.arguments != null) {
      event = widget.arguments["event"];
      imagePath = widget.arguments["imagePath"];
      print("status ${event.dates.status.code}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Stack(
          children: [
            ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.15), BlendMode.darken),
                child: (imagePath == null || imagePath.isEmpty)
                    ? Image.asset(
                        "assets/img_7.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 250,
                      )
                    : FadeInImage.assetNetwork(
                        placeholder: "assets/placeholder.png",
                        imageErrorBuilder: (context, error, stacktrace) {
                          return Image.asset(
                            "assets/placeholder.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          );
                        },
                        image: imagePath,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      )),
            InkWell(
              onTap: () {
                Util.popBack(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: SvgPicture.asset(
                  "assets/ic_back.svg",
                  color: Colors.white,
                ),
              ),
            ),
            // Positioned.fill(
            //   child: Container(
            //     alignment: Alignment.bottomCenter,
            //     padding: EdgeInsets.all(10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           margin: EdgeInsets.only(right: 5),
            //           width: 7,
            //           height: 7,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.white.withOpacity(0.50)),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(right: 5),
            //           width: 7,
            //           height: 7,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.white.withOpacity(0.50)),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(right: 5),
            //           width: 11,
            //           height: 11,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle, color: Colors.white),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(right: 5),
            //           width: 7,
            //           height: 7,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.white.withOpacity(0.50)),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(right: 5),
            //           width: 7,
            //           height: 7,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.white.withOpacity(0.50)),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
        Container(
          width: double.infinity,
          color: Color(0XFFF5F5F5),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Event Name",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600),
              //     ),
              //     Container(
              //       height: 22,
              //       width: 54,
              //       decoration: Util.getPrimaryButtonDecoration(),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.star,
              //             size: 11,
              //             color: Colors.white,
              //           ),
              //           Text(
              //             "4.7",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 11,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Text(
                Util.getEventAddress(event),
                style: TextStyle(
                    color: Color(0XFF828282),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "City Park, Manhanttan",
              //       style: TextStyle(
              //           color: Color(0XFF828282),
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     ),
              //     Text(
              //       "1.5k People Rated",
              //       style: TextStyle(
              //           color: Color(0XFF828282),
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.all(15),
        //   child: Text(
        //     "Amenities",
        //     style: TextStyle(
        //         color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        //   ),
        // ),
        // Container(
        //   margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         children: [
        //           SvgPicture.asset("assets/ic_wifi.svg"),
        //           Text(
        //             "Wifi",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 14,
        //                 color: Colors.black),
        //           )
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           SvgPicture.asset("assets/ic_ac.svg"),
        //           Text(
        //             "AC",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 14,
        //                 color: Colors.black),
        //           )
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           SvgPicture.asset("assets/ic_tv.svg"),
        //           Text(
        //             "TV",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 14,
        //                 color: Colors.black),
        //           )
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           SvgPicture.asset("assets/ic_breakfast.svg"),
        //           Text(
        //             "Breakfast",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 14,
        //                 color: Colors.black),
        //           )
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           SvgPicture.asset("assets/ic_laundry.svg"),
        //           Text(
        //             "Laundry",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 14,
        //                 color: Colors.black),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          color: Color(0XFFF5F5F5),
          height: 4,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            "About Us",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            (event.info == null)?"N/A":event.info,
            style: TextStyle(
                color: Color(0XFF828282),
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          color: Color(0XFFF5F5F5),
          height: 4,
        ),

        Container(
            margin: EdgeInsets.all(15),
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: event.priceRanges.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var priceRange= event.priceRanges[index];
                  print("price  type -> ${priceRange.type}");
                  print("price currancy -> ${priceRange.currency}");

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(priceRange.type),
                      RadioListTile(
                          title: Text('${priceRange.currency} ${priceRange.min} - ${priceRange.max}'),
                          value: index,
                          groupValue: priceValue,
                          onChanged: (val) {
                            //print("====>>>${element.rateKey}");
                            setState(() {

                              priceValue = val;
                            });
                          })
                    ],
                  );
                })),
        // Container(
        //   margin: EdgeInsets.all(15),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         children: [
        //           Container(
        //             width: 54,
        //             height: 54,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle, color: Color(0XFFF5F5F5)),
        //             child: SvgPicture.asset(
        //               "assets/ic_location.svg",
        //               width: 16,
        //               height: 26,
        //               fit: BoxFit.scaleDown,
        //             ),
        //           ),
        //           Text(
        //             "Location",
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Container(
        //             width: 54,
        //             height: 54,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle, color: Color(0XFFF5F5F5)),
        //             child: SvgPicture.asset(
        //               "assets/ic_star.svg",
        //               width: 16,
        //               height: 26,
        //               fit: BoxFit.scaleDown,
        //             ),
        //           ),
        //           Text(
        //             "Reviews",
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Container(
        //             width: 54,
        //             height: 54,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle, color: Color(0XFFF5F5F5)),
        //             child: SvgPicture.asset(
        //               "assets/ic_photos.svg",
        //               width: 16,
        //               height: 26,
        //               fit: BoxFit.scaleDown,
        //             ),
        //           ),
        //           Text(
        //             "Photos",
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Container(
        //             width: 54,
        //             height: 54,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle, color: Color(0XFFF5F5F5)),
        //             child: SvgPicture.asset(
        //               "assets/ic_similiar.svg",
        //               width: 16,
        //               height: 26,
        //               fit: BoxFit.scaleDown,
        //             ),
        //           ),
        //           Text(
        //             "Similar",
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // Container(
        //   color: Color(0XFFF5F5F5),
        //   height: 4,
        // ),
        // Container(
        //   margin: EdgeInsets.all(15),
        //   child: Text.rich(
        //     TextSpan(
        //         text: "\$456.00 ",
        //         style: TextStyle(
        //             color: Color(0XFFFF8106),
        //             fontSize: 18,
        //             fontWeight: FontWeight.w600),
        //       children:[
        //         TextSpan(text: "For 2 Guests",style: TextStyle(color: Color(0XFF828282),fontWeight: FontWeight.w400,fontSize: 14))
        //       ]
        //
        //     ),
        //   ),
        // )
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        onTap: () {
          Util.open(context, FlightConfirmBookingScreen());
        },
        child: Container(
          height: 50,
          decoration: Util.getSecondaryButtonDecoration(),
          child: Center(
            child: Text(
              "event book".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
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
