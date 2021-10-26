import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/model/hotels/Hotel.dart';
import 'package:sould_food_guide/model/hotels/HotelResponse.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:sould_food_guide/views/hotels/hotel_viewmodel.dart';
import 'package:sould_food_guide/views/search_hotels_view.dart';

class HotelScreen extends StatefulWidget {
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  HotelViewModel _hoteViewModel;
  StreamController _hotelController;

  @override
  void initState() {
    super.initState();
    _hotelController = new StreamController<RepositoryResponse>.broadcast();
    _hoteViewModel = new HotelViewModel(App());
    observeViewModel();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _hoteViewModel.getHotels(
          "2021-12-15",
          "2021-12-16",
          1,
          1,
          0,
          51.5287352,
          -0.3817868,
          5,
          "km");
    });
  }

  void observeViewModel() {
    _hoteViewModel
        .getHotelRepository()
        .getRepositoryResponse()
        .listen((response) {
      print("response code " + response.code.toString());

      if (response.code == null) {
        if (response.success) {
          _hotelController.sink.add(response);
        } else {
          _hotelController.sink.add(response);
        }
      } else {
        if (mounted) ToastUtil.showToast(context, response.msg);
      }

      // print(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = StreamBuilder<RepositoryResponse>(
      stream: _hotelController.stream,

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          RepositoryResponse response = snapshot.data;
          if (response.success) {
            HotelResponse hotelResponse = HotelResponse.fromJson(response.data);
            if (hotelResponse.hotels.hotels.isEmpty) {
              return Center(child: Text("0 Hotel Found"),);
            } else {
              List<Hotel> hotels= hotelResponse.hotels.hotels;
              print("hoteles ${hotels.join(",")}" );

              return ListView(
                primary: true,
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.60), BlendMode.darken),
                        child: Image.asset(
                          "assets/img_2.png",
                          fit: BoxFit.cover,
                          height: 120,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Util.popBack(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: SvgPicture.asset(
                                  "assets/ic_back.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "Manhattan, New York",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )),
                            Text(
                              "Check In 23 July  |  Check Out 28 July  |  2 Guests",
                              style: TextStyle(
                                  color: Color(0XFFB5B5B5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // getHorizontalList("Exclusive places"),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return getHorizontalList("Exclusive places");
                        }),
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     // Util.open(context, MainScreen());
                  //   },
                  //   child: Container(
                  //     height: 55,
                  //     margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                  //     decoration: Util.getPrimaryButtonDecoration(),
                  //     child: Center(
                  //       child: Text(
                  //         "short & filters",
                  //         style: TextStyle(color: Colors.white, fontSize: 18),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              );
            }
          } else {
            return Center(child: Text(response.msg));
          }
        } else {
         return  Center(child: CircularProgressIndicator());
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        onTap: () {
          Util.open(context, SearchHotelScreen());
        },
        child: Container(
          height: 50,
          decoration: Util.getSecondaryButtonDecoration(),
          child: Center(
            child: Text(
              "short & filters",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: SafeArea(child: body),
    );
  }

  Widget getHorizontalList(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Util.open(context, HotelDetailScreen());
            },
            child: Container(
              height: 180,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) =>
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7,
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.7,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(25)),
                                child: Image.asset(
                                  "assets/img_13.png",
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Thailand Packages",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9,
                                      color: Colors.black),
                                ),
                                Text(
                                  "\$456.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9,
                                      color: Color(0XFFFF8106)),
                                ),
                              ],
                            ),
                            Text(
                              "3 Days Nights",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8,
                                  color: Color(0XFF828282)),
                            ),
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
