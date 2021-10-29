import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/model/hotels/availability/Hotel.dart';
import 'package:sould_food_guide/model/hotels/content/Hotels.dart';
import 'package:sould_food_guide/model/hotels/detail/HotelDetailResponse.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/hotel_confirm_booking_view.dart';
import 'package:sould_food_guide/views/hotels/hotel_viewmodel.dart';

class HotelDetailScreen extends StatefulWidget {
  final arguments;

  HotelDetailScreen(this.arguments);

  @override
  _HotelDetailScreenState createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen>
    with WidgetsBindingObserver {
  HotelViewModel _hoteViewModel;

  // StreamController _availabilityController;
  StreamController _hotelController;
  StreamSubscription streamSubscription;
  Hotels contentHotel;
  Hotel availableHotel;
  RepositoryResponse _response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hotelController = new StreamController<bool>.broadcast();
    _hoteViewModel = new HotelViewModel(App());
    observeViewModel();
    // final arguments = ModalRoute
    //     .of(context)
    //     .settings
    //     .arguments as Map;

    if (widget.arguments != null) {
      contentHotel = widget.arguments["contentHotel"];
      availableHotel = widget.arguments["availableHotel"];
    }
    _hoteViewModel.getHotelRepository().getHotelDetail(
        contentHotel.code.toString(), Util.getSignature().toString());
    WidgetsBinding.instance.addObserver(this);
  }

  void observeViewModel() {
    streamSubscription = _hoteViewModel
        .getHotelRepository()
        .getRepositoryResponse()
        .listen((response) {
      if (response.code == null) {
        if (response.data is HotelDetailResponse) {
          HotelDetailResponse hotelDetailResponse = response.data;
          if (response.success) {
            _response = response;
            _hotelController.sink.add(true);
          } else {
            RepositoryResponse repositoryResponse = RepositoryResponse();
            repositoryResponse.success = false;
            if (hotelDetailResponse.error == null)
              repositoryResponse.msg = hotelDetailResponse.errorMsg == null
                  ? "Unable to get hotels"
                  : hotelDetailResponse.errorMsg;
            else
              repositoryResponse.msg = hotelDetailResponse.error.message == null
                  ? "Unable to get hotels"
                  : hotelDetailResponse.error.message;
            _response = repositoryResponse;
            _hotelController.sink.add(true);
          }
        }
      } else {
        if (mounted) ToastUtil.showToast(context, response.msg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = StreamBuilder<bool>(
        stream: _hotelController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RepositoryResponse response = this._response;
            return ListView(
              children: [
                Stack(
                  children: [
                    (contentHotel.images != null &&
                            contentHotel.images.isNotEmpty)
                        ? CarouselSlider(
                            options: CarouselOptions(
                              height: 250,

                              viewportFraction: 1.0,
                              enlargeCenterPage: false,

                              // autoPlay: false,
                            ),
                            items: contentHotel.images
                                .map(
                                  (image) => ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.15),
                                          BlendMode.darken),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/placeholder.png",
                                        imageErrorBuilder:
                                            (context, error, stacktrace) {
                                          return Image.asset(
                                            "assets/placeholder.png",
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          );
                                        },
                                        image:
                                            Util.getHotelImagePath(image.path),
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      )),
                                )
                                .toList(),
                          )
                        : ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.15),
                                BlendMode.darken),
                            child: Image.asset(
                              "assets/placeholder.png",
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 250,
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
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.50)),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.50)),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 11,
                              height: 11,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.50)),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.50)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: Color(0XFFF5F5F5),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contentHotel.name.content,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       contentHotel.name.content,
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //     // Container(
                      //     //   height: 22,
                      //     //   width: 54,
                      //     //   decoration: Util.getPrimaryButtonDecoration(),
                      //     //   child: Row(
                      //     //     mainAxisAlignment: MainAxisAlignment.center,
                      //     //     children: [
                      //     //       Icon(
                      //     //         Icons.star,
                      //     //         size: 11,
                      //     //         color: Colors.white,
                      //     //       ),
                      //     //       Text(
                      //     //         "4.7",
                      //     //         style: TextStyle(
                      //     //             color: Colors.white,
                      //     //             fontSize: 11,
                      //     //             fontWeight: FontWeight.w500),
                      //     //       ),
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      Text(
                        contentHotel.address.content,
                        style: TextStyle(
                            color: Color(0XFF828282),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       contentHotel.address.content,
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
                getAmentiesLabel(response),
                getAmenities(response),
                Container(
                  color: Color(0XFFF5F5F5),
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Text(
                    "About Us",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    contentHotel.description.content,
                    style: TextStyle(
                        color: Color(0XFF828282),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFFF5F5F5)),
                            child: SvgPicture.asset(
                              "assets/ic_location.svg",
                              width: 16,
                              height: 26,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFFF5F5F5)),
                            child: SvgPicture.asset(
                              "assets/ic_star.svg",
                              width: 16,
                              height: 26,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            "Reviews",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.APP_HOTEL_PHOTOS,
                              arguments: {"contentHotel": contentHotel});
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFF5F5F5)),
                              child: SvgPicture.asset(
                                "assets/ic_photos.svg",
                                width: 16,
                                height: 26,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text(
                              "Photos",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFFF5F5F5)),
                            child: SvgPicture.asset(
                              "assets/ic_similiar.svg",
                              width: 16,
                              height: 26,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            "Similar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0XFFF5F5F5),
                  height: 4,
                ),
                // Container(
                //   margin: EdgeInsets.all(15),
                //   child: Text.rich(
                //     TextSpan(
                //         text: "\$456.00 ",
                //         style: TextStyle(
                //             color: Color(0XFFFF8106),
                //             fontSize: 18,
                //             fontWeight: FontWeight.w600),
                //         children: [
                //           TextSpan(
                //               text: "For 2 Guests",
                //               style: TextStyle(
                //                   color: Color(0XFF828282),
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 14))
                //         ]),
                //   ),
                // )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: StreamBuilder<bool>(
          stream: _hotelController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return InkWell(
                onTap: () {
                  Util.open(context, HotelConfirmBookingScreen());
                },
                child: Container(
                  height: 50,
                  decoration: Util.getSecondaryButtonDecoration(),
                  child: Center(
                    child: Text(
                      "Book now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              );
            else
              return Container(
                width: 0,
                height: 0,
              );
          }),
      body: SafeArea(
        child: body,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    streamSubscription.cancel();
    _hotelController.close();
    super.dispose();
  }

  getAmentiesLabel(RepositoryResponse response) {
    if (response.success) {
      HotelDetailResponse hotelDetailResponse = response.data;
      if (hotelDetailResponse.hotel != null &&
          hotelDetailResponse.hotel.facilities != null &&
          hotelDetailResponse.hotel.facilities.isNotEmpty)
        return Container(
          margin: EdgeInsets.all(15),
          child: Text(
            "Amenities",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        );
      else
        return Container(
          width: 0,
          height: 0,
        );
    } else
      return Container(
        width: 0,
        height: 0,
      );
  }

  getAmenities(RepositoryResponse response) {
    if (response.success) {
      HotelDetailResponse hotelDetailResponse = response.data;
      if (hotelDetailResponse.hotel != null &&
          hotelDetailResponse.hotel.facilities != null &&
          hotelDetailResponse.hotel.facilities.isNotEmpty)
        return Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getAmentiesView(hotelDetailResponse),
          ),
        );
      else
        return Container(
          width: 0,
          height: 0,
        );
    } else
      return Container(
        width: 0,
        height: 0,
      );
  }

  getWifi(List<HotelFacilities> facilities) {
    try {
      facilities.firstWhere((HotelFacilities facility) =>
          facility.description.content
              .toLowerCase()
              .contains("Wi-fi".toLowerCase()) ||
          facility.description.content
              .toLowerCase()
              .contains("wifi".toLowerCase()) ||
          facility.description.content.toLowerCase().contains("internet"));
      return Column(
        children: [
          SvgPicture.asset("assets/ic_wifi.svg"),
          Text(
            "Wifi",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          )
        ],
      );
    } catch (e) {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  getAc(List<HotelFacilities> facilities) {
    try {
      facilities.firstWhere((HotelFacilities facility) =>
          facility.description.content
              .toLowerCase()
              .contains("Air conditioning".toLowerCase()) ||
          facility.description.content
              .toLowerCase()
              .contains("ac".toLowerCase()));
      return Column(
        children: [
          SvgPicture.asset("assets/ic_ac.svg"),
          Text(
            "AC",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          )
        ],
      );
    } catch (e) {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  getTv(List<HotelFacilities> facilities) {
    try {
      facilities.firstWhere((HotelFacilities facility) => facility
          .description.content
          .toLowerCase()
          .contains("tv".toLowerCase()));
      return Column(
        children: [
          SvgPicture.asset("assets/ic_tv.svg"),
          Text(
            "TV",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          )
        ],
      );
    } catch (e) {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  getBreakfast(List<HotelFacilities> facilities) {
    try {
      facilities.firstWhere((HotelFacilities facility) => facility
          .description.content
          .toLowerCase()
          .contains("breakfast".toLowerCase()));
      return Column(
        children: [
          SvgPicture.asset("assets/ic_breakfast.svg"),
          Text(
            "Breakfast",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          )
        ],
      );
    } catch (e) {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  getLaundry(List<HotelFacilities> facilities) {
    try {
      facilities.firstWhere((HotelFacilities facility) => facility
          .description.content
          .toLowerCase()
          .contains("Laundry".toLowerCase()));
      return Column(
        children: [
          SvgPicture.asset("assets/ic_laundry.svg"),
          Text(
            "Laundry",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          )
        ],
      );
    } catch (e) {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  getAmentiesView(HotelDetailResponse hotelDetailResponse) {
    List<Widget> list = [];
    var wifi = getWifi(hotelDetailResponse.hotel.facilities);
    var ac = getAc(hotelDetailResponse.hotel.facilities);
    var tv = getTv(hotelDetailResponse.hotel.facilities);
    var breakfast = getBreakfast(hotelDetailResponse.hotel.facilities);
    var laundry = getLaundry(hotelDetailResponse.hotel.facilities);
    if (!(wifi is Container)) list.add(wifi);
    if (!(ac is Container)) list.add(ac);

    if (!(tv is Container)) list.add(tv);

    if (!(breakfast is Container)) list.add(breakfast);
    if (!(laundry is Container)) list.add(laundry);
    return list;
  }
}
