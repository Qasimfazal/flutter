import 'package:flutter/material.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';
import 'package:sould_food_guide/repository/event_respository.dart';
import 'package:sould_food_guide/repository/hotel_respository.dart';
import 'package:sould_food_guide/repository/user_respository.dart';

import 'app_routes.dart';

/// App Class -> Application Class
class App extends StatelessWidget {
  //-------------------------------------------------------------- Singleton-Instance --------------------------------------------------------------
  // Singleton-Instance
  static final App _instance = App._internal();

  /// App Private Constructor -> App
  /// @param -> _
  /// @usage -> Create Instance of App
  App._internal();

  /// App Factory Constructor -> App
  /// @dependency -> _
  /// @usage -> Returns the instance of app
  factory App() => _instance;

  //------------------------------------------------------------ Widget Methods --------------------------------------------------------------------

  /// @override Build Method -> Widget
  /// @param -> context -> BuildContext
  /// @returns -> Returns widget as MaterialApp class instance`
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      onGenerateRoute: getAppRoutes().getRoutes,
    );
  }

  AppRoutes getAppRoutes() {
    return AppRoutes();
  }

  //------------------------------------------------------------- App Methods -------------------------------------------------------------------------

  /// Get App Preferences Method -> AppPreferences
  /// @param -> _
  /// @usage -> Returns the instance of AppPreferences class
  AppPreferences getAppPreferences() {
    return AppPreferences();
  }

//
//   //
  UserRepository getUserRepository(AppPreferences appPreferences) {
    return UserRepository(appPreferences: appPreferences);
  }

  HotelRepository getHotelRepository(AppPreferences appPreferences) {
    return HotelRepository(appPreferences: appPreferences);
  }
  EventRepository getEventRepository(AppPreferences appPreferences) {
    return EventRepository(appPreferences: appPreferences);
  }
// TermsAndConditionsRepository getTermsAndConditionRepository({@required AppPreferences appPreferences}) {
//   return TermsAndConditionsRepository(appPreferences: appPreferences);
// }
// StoreLocationRepository getStoreLocationRepository({@required AppPreferences appPreferences}) {
//   return StoreLocationRepository(appPreferences: appPreferences);
// }
// CategoryRepository getCategoryRepository({@required AppPreferences appPreferences}) {
//   return CategoryRepository(appPreferences: appPreferences);
// }
// Step1ConfirmRepository getStep1ConfirmRepository({@required AppPreferences appPreferences}) {
//   return Step1ConfirmRepository(appPreferences: appPreferences);
// }
// Step2Repository getStep2ConfirmRepository({@required AppPreferences appPreferences}) {
//   return Step2Repository(appPreferences: appPreferences);
// }
// Step4SelectTagRepository getStep4SelectTagRepository({@required AppPreferences appPreferences}) {
//   return Step4SelectTagRepository(appPreferences: appPreferences);
// }
//
// AllImagesRepository getAllImagesRepository({@required AppPreferences appPreferences}) {
//   return AllImagesRepository(appPreferences: appPreferences);
// }
//
// MyFavouriteImagesRepository getMyFavouriteImagesRepository({@required AppPreferences appPreferences}) {
//   return MyFavouriteImagesRepository(appPreferences: appPreferences);
// }
//
// InProgressImagesRepository getInProgressImagesRepository({@required AppPreferences appPreferences}) {
//   return InProgressImagesRepository(appPreferences: appPreferences);
// }
//
// ResearcherInProgressImagesRepository getResearcherInProgressImagesRepository({@required AppPreferences appPreferences}) {
//   return ResearcherInProgressImagesRepository(appPreferences: appPreferences);
// }
//
// AddStoreRepository getAddStoreRepository({@required AppPreferences appPreferences}) {
//   return AddStoreRepository(appPreferences: appPreferences);
// }
//
// FrontViewRepository getFrontViewRepository({@required AppPreferences appPreferences}) {
//   return FrontViewRepository(appPreferences: appPreferences);
// }
// FoodTypeRepository getFoodTypeRepository({@required AppPreferences appPreferences}) {
//   return FoodTypeRepository(appPreferences: appPreferences);
// }

}
