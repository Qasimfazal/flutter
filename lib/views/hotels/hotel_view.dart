import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/model/hotels/availability/AvailabilityHotelResponse.dart';
import 'package:sould_food_guide/model/hotels/availability/Hotel.dart';
import 'package:sould_food_guide/model/hotels/content/ContentHotelResponse.dart';
import 'package:sould_food_guide/model/hotels/content/Hotels.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:sould_food_guide/views/hotels/hotel_viewmodel.dart';
import 'package:sould_food_guide/views/search_hotels_view.dart';

class HotelScreen extends StatefulWidget {
  final Map map;

  HotelScreen(this.map);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> with WidgetsBindingObserver {
  HotelViewModel _hoteViewModel;

  // StreamController _availabilityController;
  StreamController _hotelController;
  StreamSubscription streamSubscription;
  List<Hotel> availableHotelList = [];
  HashMap<String, Hotel> availabilityHotels = HashMap();

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

    RepositoryResponse _response;

  int count = 0;

  @override
  void initState() {
    super.initState();
    print("map ${widget.map.toString()}");
    // _availabilityController =
    //     new StreamController<RepositoryResponse>.broadcast();
    _hotelController = new StreamController<bool>.broadcast();
    _hoteViewModel = new HotelViewModel(App());

    observeViewModel();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //
    // });

/*
    _hoteViewModel.getHotelRepository().getHotelsAvailability(
        "2021-12-15", "2021-12-16", 1, 1, 0, 40.7557338, -73.9713348, 50, "km");
*/
    _hoteViewModel.getHotelRepository().getHotelsAvailability(
        widget.map['checkIn'],  widget.map['checkOut'], int.tryParse(widget.map['rooms']), int.tryParse(widget.map['guest']),
        int.tryParse(widget.map['child'],), widget.map['lat'],widget.map['lng'], 50, "km");

    // ("2021-12-15", "2021-12-16", 1, 1, 0, 51.5287352, -0.3817868, 5, "km");

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print("hotel view dispose");
    // _availabilityController.close();
    // _hotelController.close();
    WidgetsBinding.instance.removeObserver(this);
    streamSubscription.cancel();
    _hotelController.close();

    super.dispose();
  }

  void observeViewModel() {
    streamSubscription = _hoteViewModel
        .getHotelRepository()
        .getRepositoryResponse()
        .listen((response) {
      count++;
      print("count " + count.toString());
      if (response.code == null) {
        if (response.data is AvailabilityHotelResponse) {
          AvailabilityHotelResponse hotelResponse = response.data;
          if (response.success) {
            if (hotelResponse.hotels.hotels==null || hotelResponse.hotels.hotels.isEmpty) {
              // return Center(
              //   child: Text("0 Hotel Found"),
              // );
              RepositoryResponse repositoryResponse = RepositoryResponse();
              repositoryResponse.success = true;
              ContentHotelResponse contentHotelResponse =
                  ContentHotelResponse(hotels: []);
              repositoryResponse.data = contentHotelResponse;
              _response = repositoryResponse;
              _hotelController.sink.add(true);
            } else {
              availableHotelList = hotelResponse.hotels.hotels;
              print("available hotel codes ${availableHotelList.join(",")}");

              _hoteViewModel.getHotelRepository().getHotels(
                  availableHotelList.join(","), Util.getSignature().toString());
            }
          } else {
            RepositoryResponse repositoryResponse = RepositoryResponse();
            repositoryResponse.success = false;
            if (hotelResponse.error == null)
              repositoryResponse.msg = hotelResponse.errorMsg == null
                  ? "Unable to get hotels"
                  : hotelResponse.errorMsg;
            else
              repositoryResponse.msg = hotelResponse.error.message == null
                  ? "Unable to get hotels"
                  : hotelResponse.error.message;
            _response = repositoryResponse;
            _hotelController.sink.add(true);
          }
        }
        else if (response.data is ContentHotelResponse) {
          ContentHotelResponse contentHotelResponse = response.data;
          if (response.success) {
            _response = response;
            _hotelController.sink.add(true);
          } else {
            RepositoryResponse repositoryResponse = RepositoryResponse();
            repositoryResponse.success = false;
            if (contentHotelResponse.error == null)
              repositoryResponse.msg = contentHotelResponse.errorMsg == null
                  ? "Unable to get hotels"
                  : contentHotelResponse.errorMsg;
            else
              repositoryResponse.msg =
                  contentHotelResponse.error.message == null
                      ? "Unable to get hotels"
                      : contentHotelResponse.error.message;
            _response = repositoryResponse;
            _hotelController.sink.add(true);
          }
        }

      } else {
        if (mounted) ToastUtil.showToast(context, response.msg);
      }

      // print(response);
    });

/*    _hoteViewModel
        .getHotelRepository()
        .getHotelRepoResponse()
        .listen((response) {
      if (response.code == null) {
        if (response.success) {
          _hotelController.sink.add(response);
        } else {
          _hotelController.sink.add(response);
        }
      } else {
        if (mounted) ToastUtil.showToast(context, response.msg);
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final body = StreamBuilder<bool>(
      stream: _hotelController.stream,
      builder: (context, snapshot) {
        print("snapshot.hasData ${snapshot.hasData}");
        if (snapshot.hasData) {
          RepositoryResponse response = this._response;

          if (response.success) {
            ContentHotelResponse hotelResponse = response.data;

            if (hotelResponse.hotels == null || hotelResponse.hotels.isEmpty) {
              return Center(
                child: Text("0 Hotel Found"),
              );
            } else {
              List<Hotels> hotels = hotelResponse.hotels;
              print("hotel length ${hotels.length}");
              hotels.forEach((Hotels hotel) {
                try {
                  var hotelFound = availableHotelList.firstWhere((Hotel availableHotel) => availableHotel.code == hotel.code);
                  availabilityHotels[hotelFound.code.toString()] = hotelFound;
                } catch (e) {}
              });

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
                        itemCount: hotels.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var hotel = hotels[index];
                          return InkWell(
                            onTap: (){
                              print("ontap hote click");
                              Navigator.pushNamed(context, AppRoutes.APP_HOTEL_DETAIL,arguments: {"contentHotel":hotel,"availableHotel":availabilityHotels[hotel.code.toString()]});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  EdgeInsets.only(right: 10, left: 10, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      child: (hotel.images != null &&
                                              hotel.images.isNotEmpty)
                                          ? FadeInImage.assetNetwork(
                                              placeholder:
                                                  "assets/placeholder.png",
                                              imageErrorBuilder:(context,error,stacktrace){
                                                return Image.asset(
                                                  "assets/placeholder.png",
                                                  height: 140,
                                                  fit: BoxFit.cover,
                                                );
                                              } ,
                                              image: Util.getHotelImagePath(
                                                  hotel.images[0].path),
                                              height: 140,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              "assets/placeholder.png",
                                              height: 140,
                                              fit: BoxFit.cover,
                                            ),
                                      //     Image.asset(
                                      //   "assets/img_13.png",
                                      //   height: 140,
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),

                                    child: Text(
                                      hotel.name.content,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9,
                                          color: Colors.black),
                                    ),
                                  ),
                                 /* Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
*//*
                                        Text(
                                          "Thailand Package",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9,
                                              color: Colors.black),
                                        ),
*//*Text(
                                          "3 Days Nights",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8,
                                              color: Color(0XFF828282)),
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
                                  ),*/

                                ],
                              ),
                            ),
                          );
                          // return getHorizontalList("Exclusive places");
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
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {}

    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      bottomNavigationBar: StreamBuilder<bool>(
          stream: _hotelController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              RepositoryResponse response = this._response;

              if (response.success) {
                ContentHotelResponse hotelResponse = response.data;

                if (hotelResponse.hotels == null ||
                    hotelResponse.hotels.isEmpty) {
                  return Container(
                    width: 0,
                    height: 0,
                  );
                } else {
                  return InkWell(
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
                  );
                }
              } else {
                return Container(
                  width: 0,
                  height: 0,
                );
              }
            } else {
              return Container(
                width: 0,
                height: 0,
              );
            }
          }),
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
              // Util.open(context, HotelDetailScreen());
            },
            child: Container(
              height: 180,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
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
