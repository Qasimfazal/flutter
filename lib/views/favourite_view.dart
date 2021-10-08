import 'package:flutter/material.dart';
import 'package:sould_food_guide/util/Util.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15,top: 10),
          child: Text(
            "favrourite".toUpperCase(),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          child: TabBar(
            indicatorSize:TabBarIndicatorSize.label ,
            isScrollable: true,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
            controller: tabController,
            indicatorColor: Color(0XFFFF9902),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "flights".toUpperCase(),
              ),
              Tab(
                text: "hotels".toUpperCase(),
              ),
              Tab(
                text: "restaurants".toUpperCase(),
              ),
              Tab(
                text: "events".toUpperCase(),
              ),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              color: Color(0XFFF5F5F5),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        elevation: 2,
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "American Airlines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "AA-1264",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF828282),
                                          fontSize: 10),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 65,
                                      decoration:
                                          Util.getPrimaryButtonDecoration(),
                                      child: Center(
                                        child: Text(
                                          "\$ 158.50",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                height: 1,
                                color: Color(0XFFF2F2F2),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 44,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0XFFF5F5F5),
                                      ),
                                      height: 44,
                                      child: Center(
                                        child: Image.asset("assets/img_5.png",
                                            fit: BoxFit.scaleDown,
                                            width: 36,
                                            height: 14),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "12:00 am",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "Houston",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11,
                                              color: Color(0XFF828282)),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: 2,
                                            decoration: Util
                                                .getPrimaryButtonDecoration(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 9,
                                                height: 9,
                                                decoration: Util
                                                    .getPrimaryButtonDecoration(),
                                              ),
                                              Container(
                                                width: 9,
                                                height: 9,
                                                decoration: Util
                                                    .getPrimaryButtonDecoration(),
                                              ),
                                              Container(
                                                width: 9,
                                                height: 9,
                                                decoration: Util
                                                    .getPrimaryButtonDecoration(),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "12:00 am",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "Houston",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11,
                                              color: Color(0XFF828282)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ))
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
