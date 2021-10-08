import 'package:flutter/material.dart';
import 'package:sould_food_guide/views/favourite_view.dart';
import 'package:sould_food_guide/views/home_view.dart';
import 'package:sould_food_guide/views/hotel_menu_view.dart';
import 'package:sould_food_guide/views/hotel_view.dart';
import 'package:sould_food_guide/views/user_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    HotelMenuScreen(),
    FavouriteScreen(),
    UserScreen(),

    // ExploreScreen(),
    // TripScreen(),
    // SavedScreen(),
    // Container(color: Color(0XFF222222),),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Color(0X26000000), spreadRadius: 0, blurRadius: 1),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0XFFA5A5A5)),
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Padding(
                        padding: EdgeInsets.all(5),
                        child: ImageIcon(AssetImage("assets/ic_home.png"))),
                    label: "Home"),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: ImageIcon(AssetImage("assets/ic_hotel.png"))),
                  label: 'Hotels',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: ImageIcon(AssetImage("assets/ic_fav.png"))),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  // icon: ImageIcon(AssetImage("assets/ic_profile.png")),
                  icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: ImageIcon(AssetImage("assets/ic_profile.png"))),
                  label: 'User',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (value) => setState(() {
                _selectedIndex = value;
              }),
              selectedItemColor: Color(0XFFFF8106),
              unselectedItemColor: Color(0XFFA5A5A5),
            ),
          ),
        ));
  }
}
