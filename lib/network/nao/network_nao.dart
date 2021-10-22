import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sould_food_guide/repository/resource.dart';
import 'package:sould_food_guide/util/network_util.dart';

import '../network_config.dart';
import '../network_endpoints.dart';

/// Login Network Access Object Class -> Network Access Object class for handling network requests of Login process
class NetworkNAO {
  /// STATIC Is Authentic User Method -> Future<UserModel>
  /// @param -> @required userName -> String
  ///        -> @required userPassword -> String
  /// @usage -> Makes a HTTP-POST request to REST api on server.
  // static Future<dynamic> registerKid(
  //         String deviceID, String type, String age, String gender) =>
  //     NetworkUtil()
  //         .post(
  //             // HTTP-POST request
  //             url: NetworkEndpoints.REGISTER_API, // RE// ST api URL
  //             formData: FormData.fromMap({
  //               // Request body
  //               NetworkConfig.API_KEY_USER_DEVICE_ID: deviceID,
  //               NetworkConfig.API_KEY_USER_TYPE: type,
  //               NetworkConfig.API_KEY_USER_AGE: age,
  //               NetworkConfig.API_KEY_USER_GENDER: gender
  //             }))
  //         .then((dynamic response) {
  //       // On response received
  //       print(response);
  //       return response; // Map json response to UserModel object
  //     });

  static Future<dynamic> login(String email, String password) => NetworkUtil()
      .post(
          url: NetworkEndpoints.API_LOGIN,
          formData: FormData.fromMap({
            NetworkConfig.PARAM_EMAIL: email,
            NetworkConfig.PARAM_PASSWORD: password
          }))
      .then((dynamic response) {
        // On response received
        print(response);
        return response; // Map json response to UserModel object
      });
//
// static Future<dynamic> registerResearcher(String deviceID, String type) =>
//     NetworkUtil().post(
//         // HTTP-POST request
//         url: NetworkEndpoints.REGISTER_API, // REST api URL
//         formData: FormData.fromMap({
//           // Request body
//           NetworkConfig.API_KEY_USER_DEVICE_ID: deviceID,
//           NetworkConfig.API_KEY_USER_TYPE: type,
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
//
// static Future<dynamic> uploadstepsData(
//        FormData formData ,String url) =>
//     NetworkUtil()
//         .callImagesAPI(formData,url)
//         .then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
//
// static Future<dynamic> checkDeviceExist({String deviceID}) => NetworkUtil()
//     .get(
//   url: NetworkEndpoints.CHECK_DEVICE_EXISTS + "?device_id="+deviceID,
// )
//     .then((dynamic response) {
//   return response;
// });
//
//
// static Future<dynamic> getTag() => NetworkUtil()
//         .get(
//       url: NetworkEndpoints.TAGS,
//     )
//         .then((dynamic response) {
//   print(response);
//       return response;
//     });
//
// static Future<dynamic> getStoreLocation({String deviceID}) => NetworkUtil()
//         .get(
//       url: NetworkEndpoints.STORE_LOCATION + "?device_id="+deviceID,
//     )
//         .then((dynamic response) {
//   print(response);
//       return response;
//     });
// static Future<dynamic> getCategory() => NetworkUtil()
//         .get(
//       url: NetworkEndpoints.CATEGORY,
//     )
//         .then((dynamic response) {
//   print(response);
//       return response;
//     });
//
// static Future<dynamic> getFoodTypes() => NetworkUtil()
//     .get(
//   url: NetworkEndpoints.GET_FOOD_TYPES,
// )
//     .then((dynamic response) {
//   print(response);
//   return response;
// });
//
// static Future<dynamic> getStoreCategories() => NetworkUtil()
//     .get(
//   url: NetworkEndpoints.STORE_CATEGORIES,
// )
//     .then((dynamic response) {
//   print(response);
//   return response;
// });
//
// static Future<dynamic> getProducts({String deviceID}) => NetworkUtil()
//     .get(
//   url: NetworkEndpoints.GET_PRODUCTS + "?device_id="+deviceID,
// )
//     .then((dynamic response) {
//   print(response);
//   return response;
// });
//
// static Future<dynamic> getMyFavouriteProducts({String deviceID, String isFavourite}) => NetworkUtil()
//     .get(
//   url: NetworkEndpoints.GET_PRODUCTS + "?device_id="+deviceID + "&is_favourite="+isFavourite ,
// )
//     .then((dynamic response) {
//   return response;
// });
//
// static Future<dynamic> getResearcherLocationForProgress({String deviceID}) => NetworkUtil()
//     .get(
//   url: NetworkEndpoints.ADD_RESEARCHER_PROGRESS1 + "/"+deviceID ,
// )
//     .then((dynamic response) {
//   print(response);
//   return response;
// });
//
// static Future<dynamic> getInProgressProducts({String url}) =>
//
//   NetworkUtil()
//       .get(
//     url: url,
//   )
//       .then((dynamic response) {
//     print(response);
//     return response;
//   });
//
//
// static Future<dynamic> addStep4Data(String productId,String tadId,String tag2Id,String colourId,String colourId2) =>
//     NetworkUtil().post(
//       // HTTP-POST request
//         url: NetworkEndpoints.STEP4TAGS, // REST api URL
//         formData: FormData.fromMap({
//           // Request body
//           NetworkConfig.API_KEY_PRODUCT_ID: productId,
//           NetworkConfig.API_KEY_TAG1: tadId,
//           NetworkConfig.API_KEY_TAG2: tag2Id,
//           NetworkConfig.API_KEY_COLOUR1: colourId,
//           NetworkConfig.API_KEY_COLOUR2: colourId2,
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
// static Future<dynamic> publish(String productId) =>
//     NetworkUtil().post(
//       // HTTP-POST request
//         url: NetworkEndpoints.PUBLISH, // REST api URL
//         formData: FormData.fromMap({
//           // Request body
//           NetworkConfig.API_KEY_PRODUCT_ID: productId,
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
//
// static Future<dynamic> addRemoveProductsFromFavourite({int productId,int isFavourite}) =>
//     NetworkUtil().post(
//       // HTTP-POST request
//         url: NetworkEndpoints.ADD_REMOVE_FROM_FAVOURITES, // REST api URL
//         formData:FormData.fromMap( {
//           // Request body
//           NetworkConfig.API_KEY_PRODUCT_ID: productId.toString(),
//           NetworkConfig.API_KEY_IS_FAVOURITE: isFavourite.toString(),
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
//
// static Future<dynamic> callIsNutrationCorrectAPI(String productId, String status) =>
//     NetworkUtil().post(
//       // HTTP-POST request
//         url: NetworkEndpoints.IS_NUTRIONT_CORRECT, // REST api URL
//         formData:FormData.fromMap( {
//           // Request body
//           "product_id": productId,
//           "is_nutrition_correct": status,
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
// static Future<dynamic> callIsIngridentCorrectAPI(String productId, String status) =>
//     NetworkUtil().post(
//       // HTTP-POST request
//         url: NetworkEndpoints.IS_INGRIDENT_CORRECT, // REST api URL
//         formData:FormData.fromMap( {
//           // Request body
//           "product_id": productId,
//           "is_ingredients_correct": status,
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });
//
// static Future<dynamic> addStore(String device_id,String name,String postal_code,String city,String province, String store_category_id) =>
//     NetworkUtil().post(
//       // HTTP-POST request
//         url: NetworkEndpoints.ADD_STORE, // REST api URL
//         formData:FormData.fromMap( {
//           // Request body
//           NetworkConfig.API_KEY_USER_DEVICE_ID: device_id,
//           NetworkConfig.API_KEY_NAME: name,
//           NetworkConfig.API_KEY_POSTAL_CODE: postal_code,
//           NetworkConfig.API_KEY_CITY: city,
//           NetworkConfig.API_KEY_PROVINCE: province,
//           NetworkConfig.API_KEY_STORE_CATEGORY_ID: store_category_id,
//         })).then((dynamic response) {
//       // On response received
//       print(response);
//       return response; // Map json response to UserModel object
//     });

}
