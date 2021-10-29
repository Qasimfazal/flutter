import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sould_food_guide/model/hotels/content/Hotels.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HotelImages extends StatefulWidget {
  final arguments;

  HotelImages(this.arguments);

  @override
  _HotelImagesState createState() => _HotelImagesState();
}

class _HotelImagesState extends State<HotelImages> {
  Hotels contentHotel;

  @override
  void initState() {
    super.initState();
    if (widget.arguments != null) {
      contentHotel = widget.arguments["contentHotel"];
    }
  }
    @override
    Widget build(BuildContext context) {
      final body = Column(
        children: [
          Util.getBack(context),
          Container
            (
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
                Text(
                  contentHotel.address.content,
                  style: TextStyle(
                      color: Color(0XFF828282),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              (contentHotel.images != null &&
                  contentHotel.images.isNotEmpty)
                  ? CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height*0.760,

                  viewportFraction: 1.0,
                  enlargeCenterPage: false,

                  // autoPlay: false,
                ),
                items: contentHotel.images
                    .map(
                      (image) =>
                      ColorFiltered(
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                              );
                            },
                            image: Util.getHotelImagePath(image.path),
                            fit: BoxFit.cover,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          )),
                )
                    .toList(),
              )
                  : ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.15), BlendMode.darken),
                  child: Image.asset(
                    "assets/placeholder.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.bottomCenter,
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
        ],
      );
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child
              :
          body
          ,
        )
        ,
      );
    }
  }
