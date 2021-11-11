import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/util/network_util.dart';

import '../network_config.dart';
import '../network_endpoints.dart';

/// Login Network Access Object Class -> Network Access Object class for handling network requests of Login process
class NetworkNAO {
  static Future<RepositoryResponse> login(String email, String password) =>
      NetworkUtil().post(
          // HTTP-POST request
          url: NetworkEndpoints.API_LOGIN,
          body: {
            // Request body
            NetworkConfig.PARAM_EMAIL: email,
            NetworkConfig.PARAM_PASSWORD: password,
          }).then((RepositoryResponse response) {
        return response; // Map json response to UserModel object
      });

  static Future<RepositoryResponse> forgotPassword(String email) =>
      NetworkUtil().post(url: NetworkEndpoints.API_FORGOT, body: {
        NetworkConfig.PARAM_EMAIL: email
      }).then((RepositoryResponse response) {
        return response;
      });

  static Future<RepositoryResponse> resetPassword(
          String code, String password, String confirmPassword) =>
      NetworkUtil().post(url: NetworkEndpoints.API_RESET_PASSWORD, body: {
        NetworkConfig.PARAM_CODE: code,
        NetworkConfig.PARAM_PASSWORD: password,
        NetworkConfig.PARAM_CONFIRM_PASSWORD: confirmPassword,
      }).then((RepositoryResponse response) {
        return response;
      });
  static Future<RepositoryResponse> updatePic(String imagePath, String token)=>
  NetworkUtil().uploadMultiMedia(url: NetworkEndpoints.API_UPDATE_PROFILE_PIC,path: imagePath,param: "profile_picture",
  headers: <String,String>{
    'Authorization':'Bearer $token'
  }
  ).then((RepositoryResponse response){
    return response;
  });

  static Future<RepositoryResponse> updateProfile(
          String name, String phone, String dob, String address,String token) =>
      NetworkUtil().post(url: NetworkEndpoints.API_UPDATE_PROFILE, headers:<String,String>{
        'Authorization':'Bearer $token'

      },body: {
        NetworkConfig.PARAM_NAME: name,
        NetworkConfig.PARAM_PHONE: phone,
        NetworkConfig.PARAM_DOB: dob,
        NetworkConfig.PARAM_ADDRESS: address,
      }).then((RepositoryResponse response) {
        return response;
      });

  static Future<RepositoryResponse> signUp(
    String name,
    String email,
    String password,
    String phone,
    String path,
  ) =>
      NetworkUtil().uploadMultiMedia(
          url: NetworkEndpoints.API_SIGN_UP,
          path: path,
          param: "profile_picture",
          body: {
            NetworkConfig.PARAM_NAME: name,
            NetworkConfig.PARAM_EMAIL: email,
            NetworkConfig.PARAM_PASSWORD: password,
            NetworkConfig.PARAM_PHONE: phone,
          }).then((RepositoryResponse response) {
        return response;
      });

  // {
  // "stay": {
  // "checkIn": "2021-12-15",
  // "checkOut": "2021-12-16"
  // },
  // "occupancies": [
  // {
  // "rooms": 1,
  // "adults": 1,
  // "children": 0
  // }
  // ],
  // "geolocation": {
  // "latitude": 51.5287352,
  // "longitude": -0.3817868,
  // "radius": 5,
  // "unit": "km"
  // }
  // }
  static Future<RepositoryResponse> getEvents(String city, int page) =>
      NetworkUtil()
          .getEvents(
              url: NetworkEndpoints.EVENTS +
                  '?' +
                  Uri(queryParameters: {
                    "apikey": NetworkConfig.EVENT_API_KEY,
                    "city": city.toString(),
                    "page": page.toString()
                  }).query)
          .then((RepositoryResponse response) {
        return response;
      });

  static Future<RepositoryResponse> getHotels(String codes, String signature) =>
      NetworkUtil().getHotel(
          url: NetworkEndpoints.HOTEL_CONTENT + "?codes=" + codes,
          headers: <String, String>{
            'Api-key': NetworkConfig.HOTEL_API_KEY,
            'X-Signature': signature,
            'Content-Type': "application/json",
            // 'Accept': "application/json",
          }).then((RepositoryResponse response) {
        return response;
      });

  static Future<RepositoryResponse> getHotelDetail(
          String code, String signature) =>
      NetworkUtil().getHotel(
          url: NetworkEndpoints.HOTEL_DETAIL_CONTENT
              .replaceFirst("{hotelCode}", code),
          headers: <String, String>{
            'Api-key': NetworkConfig.HOTEL_API_KEY,
            'X-Signature': signature,
            'Content-Type': "application/json",
            // 'Accept': "application/json",
          }).then((RepositoryResponse response) {
        return response;
      });

  static Future<RepositoryResponse> getHotelsAvailability(
          String checkIn,
          String checkout,
          int rooms,
          int adults,
          int children,
          double latitude,
          double longitude,
          int radius,
          String unit,
          String signature) =>
      NetworkUtil()
          .postHotel(url: NetworkEndpoints.HOTELS, headers: <String, String>{
        'Api-key': NetworkConfig.HOTEL_API_KEY,
        'X-Signature': signature,
        'Content-Type': "application/json",
        // 'Accept': "application/json",
      }, body: {
        'stay': {'checkIn': checkIn, 'checkOut': checkout},
        'occupancies': [
          {'rooms': rooms, 'adults': adults, 'children': children}
        ],
        'geolocation': {
          'latitude': latitude,
          'longitude': longitude,
          'radius': radius,
          'unit': unit
        }
      }).then((RepositoryResponse response) {
        return response;
      });

  static Future<RepositoryResponse> bookings(String signature,
          {String ratekey}) =>
      NetworkUtil()
          .postHotel(url: NetworkEndpoints.HOTELS, headers: <String, String>{
        'Api-key': NetworkConfig.HOTEL_API_KEY,
        'X-Signature': signature,
        'Content-Type': "application/json",
        // 'Accept': "application/json",
      }, body: {
        "holder": {"name": "HolderFirstName", "surname": "HolderLastName"},
        "rooms": [
          {
            "rateKey": ratekey,
            "paxes": [
              {
                "roomId": 1,
                "type": "AD",
                "name": "First Adult Name",
                "surname": "Surname"
              }
            ]
          }
        ],
        "clientReference": "IntegrationAgency",
        "remark": "Booking remarks are to be written here.",
        "tolerance": 2
      }).then((RepositoryResponse response) {
        return response;
      });
}
