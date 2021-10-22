import 'package:flutter/material.dart';
import 'package:sould_food_guide/views/splash_view.dart';



class AppRoutes {
  //--------------------------------------------------------------- Constants ------------------------------------------------------------------------
  static const String APP_SPLASH = "/splash";
  static const String APP_FRONT = "/front";
  static const String APP_ROUTE_LOGIN = "/login";

  static const String APP_ROUTE_SELECT_GENDER = "/SelectGenderScreen";
  static const String APP_ROUTE_SELECT_AGE = "/SelectAGE";
  static const String APP_ROUTE_RESEARCHER= "/researcher";
  static const String APP_ROUTE_KID= "/kid";
  static const String APP_ROUTE_TERMS= "/TermsAndConditionsScreen";
  static const String APP_ROUTE_ON_BOARDING= "/OnboardingScreen";
  static const String APP_ROUTE_HOME= "/HomeScreen";

  static const String APP_ROUTE_STORE_SCREEN= "/SelectStoreScreen";
  static const String APP_ROUTE_CREATE_STORE_SCREEN= "/CreateStoreScreen";
  static const String APP_ROUTE_CATEGORY_SCREEN= "/SelectCategoryScreen";

  //step 1
  static const String APP_ROUTE_STEP1_ADD_PACKAGING = "/Step1_AddPackagingView";
  static const String APP_ROUTE_STEP1_CONFIRMED = "/Step1_ConfirmCapturedImageView";

  //step 2
  static const String APP_ROUTE_STEP2_CAPTURE_NUTRITIONS_FACTS = "/Step2_AddNutritionsImageView";
  static const String APP_ROUTE_STEP2_CONFIRMED_CAPTURED = "/Step2_ConfirmCapturedImageView";
  static const String APP_ROUTES_STEP2_CONFIRM_VIEW= "/Step2_ConfirmNutritionFactsView";
  static const String APP_ROUTES_STEP2_CROP_VIEW= "/Step2_NutritionImageCropView";

  //step 3
  static const String APP_ROUTE_STEP3_CAPTURE_INGREDIENTS_LIST = "/Step3_AddIngredientsImageView";
  static const String APP_ROUTE_STEP3_CONFIRMED_CAPTURED = "/Step3_ConfirmCapturedImageView";
  static const String APP_ROUTES_STEP3_CONFIRM_VIEW= "/Step3_ConfirmIngridientsListView";
  static const String APP_ROUTES_STEP3_CROP_VIEW= "/Step3_IngredientsImageCropView";

  //Step 4
  static const String APP_ROUTE_STEP4_SELECT_TAG = "/selecttag";

  //Step 5
  static const String APP_ROUTE_STEP5= "/step5_publish_view";
  static const String APP_ROUTE_STEP4_ANOTHER_REASON= "/step4_another_reason_view"; //Step5Publish



  static const String APP_ROUTE_STEP3_INGRIDIENT_LIST= "/ingridient_list_screen";
  static const String APP_ROUTE_STEP3_INGRIDIENT_CONFIRM= "/ingridient_list_confirm_screen";
  static const String APP_ROUTES_INPORGRESS= "/InProgressScreen";
  static const String APP_ROUTE_FOOD_TYPE= "/SelectFoodTypeScreen";



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
