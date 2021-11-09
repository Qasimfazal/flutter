import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/model/event/EventResponse.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/views/event/event_viewmodel.dart';
import 'package:sould_food_guide/views/event_detail_view.dart';
import 'package:sould_food_guide/views/fliter_view.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with WidgetsBindingObserver {
  EventViewModel _eventViewModel;
  StreamController _eventController;
  StreamSubscription eventStreamSubscription;
  RepositoryResponse _response;

  @override
  void initState() {
    super.initState();
    _eventController = new StreamController<bool>.broadcast();
    _eventViewModel = new EventViewModel(App());
    observeViewModel();
    _eventViewModel.getEventRepository().getEvents("sydney", 1);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    eventStreamSubscription.cancel();
    _eventController.close();
    super.dispose();
  }

  void observeViewModel() {
    eventStreamSubscription = _eventViewModel
        .getEventRepository()
        .getRepositoryResponse()
        .listen((response) {
          if(response.code ==null){
            if(response.data is EventResponse){
              if(response.success){
                EventResponse eventResponse = response.data;
                if(eventResponse.fault!=null ){
                //

                  RepositoryResponse repositoryResponse = RepositoryResponse();
                  repositoryResponse.success = false;
                  repositoryResponse.msg = eventResponse.fault.faultstring;
                  _response = repositoryResponse;
                  _eventController.sink.add(true);
                }else {

                  _response = response;
                  _eventController.sink.add(true);

                }

              }
            }


          }else {
            if (mounted) ToastUtil.showToast(context, response.msg);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = StreamBuilder<bool>(
        stream: _eventController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RepositoryResponse response = this._response;
            if(response.success){
              EventResponse eventResponse = response.data;
              if(eventResponse.eEmbedded ==null || eventResponse.eEmbedded.events==null ||
              eventResponse.eEmbedded.events.isEmpty
              ){
                return Center(
                  child: Text("0 Event Found"),
                );
              }else {
                List<Events> events= eventResponse.eEmbedded.events;
                return ListView(
                  primary: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Stack(
                      children: [
                        ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.45), BlendMode.darken),
                            child: Image.asset(
                              "assets/img_10.png",
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 150,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  "Search Events",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Location",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0XFFB5B5B5)),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.location_on_rounded,
                                        color: Color(0XFFFF8106),
                                        size: 15,
                                      )),
                                  Text(
                                    "Manhattan, New York",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, right: 5),
                                width: double.infinity,
                                height: 1,
                                color: Color(0XFF8F8F8F),
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
                          itemCount: events.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var event = events[index];
                            var imagePath =Util.getEventImage(event);
                            // return getHorizontalList("Exclusive places");
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.APP_EVENT_DETAIL,
                                    arguments: {
                                      "event": event,
                                      "imagePath":imagePath
                                    });
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
                                        child: (event.images != null &&
                                            event.images.isNotEmpty)
                                            ? FadeInImage.assetNetwork(
                                          placeholder:
                                          "assets/placeholder.png",
                                          imageErrorBuilder:
                                              (context, error, stacktrace) {
                                            return Image.asset(
                                              "assets/placeholder.png",
                                              height: 140,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                          image: imagePath,
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
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       "Event Name",
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w600,
                                    //           fontSize: 14,
                                    //           color: Colors.black),
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
                                      event.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      Util.getEventAddress(event),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0XFF828282)),
                                    ),
                                  ],
                                ),
                              ),
                            );
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

            }else {
              return Center(child: Text(response.msg),);
            }

          }else
            return Center(child: CircularProgressIndicator());

        });
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: InkWell(
      //   onTap: () {
      //     Util.open(context, FilterScreen());
      //   },
      //   child: Container(
      //     height: 50,
      //     decoration: Util.getSecondaryButtonDecoration(),
      //     child: Center(
      //       child: Text(
      //         "short & filters",
      //         style: TextStyle(color: Colors.white, fontSize: 18),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(child: body),
    );
  }

  Widget getHorizontalList(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Container(
        height: 195,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Image.asset(
                              "assets/img_12.png",
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Event Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 22,
                              width: 54,
                              decoration: Util.getPrimaryButtonDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Manhattan, New York",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0XFF828282)),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
