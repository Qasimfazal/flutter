import 'package:flutter/material.dart';
import 'package:sould_food_guide/views/hotel_detail_view.dart';
import 'package:sould_food_guide/views/hotel_images.dart';
import 'package:sould_food_guide/views/hotels/hotel_view.dart';
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
            builder: (BuildContext context) => HotelScreen(),
          );
        }
        case APP_HOTEL_DETAIL :
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => HotelDetailScreen(routeSettings.arguments),
          );
        }
        case APP_HOTEL_PHOTOS :
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => HotelImages(routeSettings.arguments),
          );
        }

      //   case APP_ROUTE_HOME:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             HomeScreen(),
      //       );
      //     }
      //   case APP_ROUTE_STORE_SCREEN:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => SelectStoreScreen(),
      //       );
      //     }
      //
      //   case APP_ROUTE_SELECT_AGE:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             AgeSelectionScreen(),
      //       );
      //     }
      //   case APP_ROUTE_FOOD_TYPE:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             SelectFoodTypeScreen(routeSettings.arguments),
      //       );
      //     }
      //   case APP_ROUTE_SELECT_GENDER:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             GenderSelectionScreen(routeSettings.arguments),
      //       );
      //     }
      //   case APP_ROUTE_TERMS:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             TermsAndConditionsScreen(routeSettings.arguments),
      //       );
      //     }
      //
      //     //Step 1
      //   case APP_ROUTE_STEP1_ADD_PACKAGING:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step1AddPackagingView(routeSettings.arguments),
      //       );
      //     }
      //   case APP_ROUTE_STEP1_CONFIRMED:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step1ConfirmCapturedImageView(routeSettings.arguments),
      //       );
      //     }
      //     //Step 1 Ends
      //
      //   //Step 2
      //   case APP_ROUTE_STEP2_CAPTURE_NUTRITIONS_FACTS: //1
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => Step2AddNutritionsImageView(),
      //       );
      //     }
      //
      //   case APP_ROUTE_STEP2_CONFIRMED_CAPTURED: //2
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step2ConfirmCapturedImageView(routeSettings.arguments),
      //       );
      //     }
      //
      //   case APP_ROUTES_STEP2_CONFIRM_VIEW: //3
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step2ConfirmNutritionFactsView(routeSettings.arguments),
      //       );
      //     }
      //
      //   case APP_ROUTES_STEP2_CROP_VIEW: //3 Step2_NutritionsImageCropView
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step2NutritionsImageCropView(routeSettings.arguments),
      //       );
      //     }
      //
      //     //Step 3
      //
      //   case APP_ROUTE_STEP3_CAPTURE_INGREDIENTS_LIST: //1 Ingredients_ImageCropView
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step3AddIngredientsImageView(),
      //       );
      //     }
      //
      //   case APP_ROUTE_STEP3_CONFIRMED_CAPTURED: //2
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step3ConfirmCapturedImageView(routeSettings.arguments),
      //       );
      //     }
      //
      //   case APP_ROUTES_STEP3_CONFIRM_VIEW: //3
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step3ConfirmIngridientsListView(routeSettings.arguments),
      //       );
      //     }
      //
      //   case APP_ROUTES_STEP3_CROP_VIEW: //3
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             IngredientsImageCropView(routeSettings.arguments),
      //       );
      //     }
      //
      //
      // //step 4
      //   case APP_ROUTE_STEP4_SELECT_TAG:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => Step4SelectTagView(),
      //       );
      //     }
      //
      //   case APP_ROUTE_STEP4_ANOTHER_REASON:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => StepAnotherReasonSelectTag(routeSettings.arguments),
      //       );
      //     }
      //
      //     //Step 5
      //   case APP_ROUTE_STEP5:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => Step5Publish(),
      //       );
      //     }
      //
      //   case APP_ROUTE_ON_BOARDING:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => OnboardingScreen(),
      //       );
      //     }
      //   case APP_ROUTES_INPORGRESS:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             InProgressScreen(routeSettings.arguments),
      //       );
      //     }
      //   case APP_ROUTE_CREATE_STORE_SCREEN:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => CreateStoreScreen(),
      //       );
      //     }
      //   case APP_ROUTE_CATEGORY_SCREEN:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             SelectCategoryScreen(routeSettings.arguments),
      //       );
      //     }
      //   case APP_ROUTE_STEP3_INGRIDIENT_LIST:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) => Step3AddIngredientsImageView(),
      //       );
      //     }
      //   case APP_ROUTE_STEP4_ANOTHER_REASON:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             StepAnotherReasonSelectTag(routeSettings.arguments),
      //       );
      //     }
      //
      //   case APP_ROUTE_STEP3_INGRIDIENT_CONFIRM:
      //     {
      //       return MaterialPageRoute<void>(
      //         settings: routeSettings,
      //         builder: (BuildContext context) =>
      //             Step3ConfirmIngridientsListView(routeSettings.arguments),
      //       );
      //     }
      //
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
