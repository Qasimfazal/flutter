import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/util/gradient_icon.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      primary: true,
      children: [
        Util.getBack(context),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "REVIEWS BY YOU",
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "78 Reviews",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0XFFFF7209)),
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          color: Color(0XFFF5F5F5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Reviews",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 13),
            ),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 15,
            separatorBuilder: (context,index)=>Container(

              height: 3,
              margin: EdgeInsets.only(top: 10,bottom: 10),
              width: double.infinity,
              color: Color(0XFFF5F5F5),
            ),
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                image: AssetImage("assets/img_4.png"),
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                                child: InkWell(onTap: () {}),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hotel green view",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                              Text(
                                "22 jan 21. 11:30 am",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0XFF828282)),
                              ),
                            ],
                          ),
                          RatingBarIndicator(
                            rating: 5,
                            itemBuilder: (context, index) => GradientIcon(
                                Icons.star,
                                15.0,
                                LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0XFFFF9902),
                                      Color(0XFFFF3B14)
                                    ])),
                            itemCount: 5,
                            itemSize: 20.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 10),
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",style: TextStyle(
                        fontSize: 13,fontWeight: FontWeight.w400,color:   Color(0XFF828282)
                      ),),
                    )
                  ],
                )),
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
