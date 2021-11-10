import 'package:flutter/material.dart';
import 'package:sould_food_guide/views/event/events_view.dart';
import 'package:sould_food_guide/views/event_detail_view.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:sould_food_guide/views/hotel_images.dart';
import 'package:sould_food_guide/views/hotel_location_view.dart';
import 'package:sould_food_guide/views/hotel_review_view.dart';
import 'package:sould_food_guide/views/hotels/hotel_view.dart';
import 'package:sould_food_guide/views/profile/edit_profile_view.dart';
import 'package:sould_food_guide/views/reset_password/forgot_password_view.dart';
import 'package:sould_food_guide/views/reset_password/reset_password_view.dart';
import 'package:sould_food_guide/views/search_hotels_view.dart';
import 'package:sould_food_guide/views/splash_view.dart';

import '../views/login/login_view.dart';
import '../views/main_view.dart';

class AppRoutes {
  //--------------------------------------------------------------- Constants ------------------------------------------------------------------------
  static const String APP_SPLASH = "/splash";
  static const String APP_FRONT = "/front";
  static const String APP_ROUTE_LOGIN = "/login";
  static const String APP_MAIN_SCREEN = "/main";
  static const String APP_HOTEL_FILTER = "/hotel_filter";
  static const String APP_HOTELS = "/hotels";
  static const String APP_HOTEL_DETAIL = "/hotel_detail";
  static const String APP_HOTEL_PHOTOS = "/hotel_images";
  static const String APP_HOTEL_LOCATION = "/hotel_location";
  static const String APP_HOTEL_REVIEW = "/hotel_review";
  static const String APP_EVENT = "/event";
  static const String APP_EVENT_DETAIL = "/event_detail";
  static const String APP_FORGOT = "/forgot";

  // static const String APP_CODE_VERIFY = "/verify_code";
  static const String APP_RESET_PASSWORD = "/reset_password";
  static const String APP_EDIT_PROFILE = "/edit_profile";

  //--------------------------------------------------------------- Methods --------------------------------------------------------------------------

  /// Get Routes Method -> Route
  /// @param -> routeSettings -> RouteSettings
  /// @usage -> Returns route based on requested route settings
  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case APP_FRONT:
      //   {
      //     return MaterialPageRoute<void>(
      //       settings: routeSettings,
      //       builder: (BuildContext context) => FrontScreen(),
      //     );
      //   }
      case APP_SPLASH:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => SplashScreen(),
          );
        }
      case APP_ROUTE_LOGIN:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => LoginScreen(),
          );
        }
      case APP_MAIN_SCREEN:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => MainScreen(),
          );
        }
      case APP_HOTEL_FILTER:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => SearchHotelScreen(),
          );
        }
      case APP_HOTELS:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                HotelScreen(routeSettings.arguments),
          );
        }
      case APP_HOTEL_REVIEW:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => HotelReviewScreen(),
          );
        }
      case APP_HOTEL_DETAIL:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                HotelDetailScreen(routeSettings.arguments),
          );
        }
      case APP_HOTEL_PHOTOS:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                HotelImages(routeSettings.arguments),
          );
        }
      case APP_HOTEL_LOCATION:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                HotelLocationView(routeSettings.arguments),
          );
        }
      case APP_EVENT:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => EventsScreen(),
          );
        }
      case APP_EVENT_DETAIL:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                EventDetailScreen(routeSettings.arguments),
          );
        }
      case APP_FORGOT:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ForgotPasswordScreen(),
          );
        }
      case APP_RESET_PASSWORD:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ResetPasswordScreen(),
          );
        }
        case APP_EDIT_PROFILE :
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => EditProfileScreen(),
          );
        }

      default:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => SplashScreen(),
          );
        }
    }
  }
}
