import 'dart:async';

import 'package:sould_food_guide/model/hotels/availability/AvailabilityHotelResponse.dart';
import 'package:sould_food_guide/model/hotels/content/ContentHotelResponse.dart';
import 'package:sould_food_guide/model/hotels/detail/HotelDetailResponse.dart';
import 'package:sould_food_guide/model/hotels/detail/Hotel_detail_model.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';
import 'package:sould_food_guide/util/Util.dart';
// import 'package:rxdart/rxdart.dart';

class HotelRepository {
  AppPreferences _appPreferences;

  // var _availabilityResponse = StreamController<RepositoryResponse>.broadcast();
  // var _hotelResponse = StreamController<RepositoryResponse>.broadcast();
  StreamController<RepositoryResponse> _repositoryResponse =
      StreamController.broadcast();

  factory HotelRepository({AppPreferences appPreferences}) =>
      HotelRepository._internal(appPreferences);

  HotelRepository._internal(this._appPreferences);

  Future<void> getHotelDetail(String code, String signature) async {
    RepositoryResponse response =
        await NetworkNAO.getHotelDetail(code, signature);
    try {
      // HotelDetailResponse hotelDetailResponse =
      //     HotelDetailResponse.fromJson(response.data);

      HotelDetailModel pojo = HotelDetailModel.fromJson(response.data);
      if (response.success) {
        response.data = pojo;
        _repositoryResponse.add(response);
      } else {
        _repositoryResponse.add(response);
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());
      print("e " + e.toString());
      HotelDetailResponse hotelDetailResponse = HotelDetailResponse();
      hotelDetailResponse.errorMsg = e.toString();
      response.data = hotelDetailResponse;
      response.success = false;
      response.msg = e.toString();
      _repositoryResponse.add(response);
    }
  }

  Future<void> getHotels(String codes, String signature) async {
    RepositoryResponse response = await NetworkNAO.getHotels(codes, signature);
    try {
      ContentHotelResponse contentHotelResponse =
          ContentHotelResponse.fromJson(response.data);
      if (response.success) {
        response.data = contentHotelResponse;
        _repositoryResponse.add(response);
      } else {
        _repositoryResponse.add(response);
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());
      print("e " + e.toString());
      ContentHotelResponse contentHotelResponse = ContentHotelResponse();
      contentHotelResponse.errorMsg = e.toString();
      response.data = contentHotelResponse;
      response.success = false;
      response.msg = e.toString();
      _repositoryResponse.add(response);
    }
  }

  Future<void> getHotelsAvailability(
      String checkIn,
      String checkOut,
      int rooms,
      int adults,
      int children,
      double latitude,
      double longitude,
      int radius,
      String unit) async {
    RepositoryResponse response = await NetworkNAO.getHotelsAvailability(
        checkIn,
        checkOut,
        rooms,
        adults,
        children,
        latitude,
        longitude,
        radius,
        unit,
        Util.getSignature().toString());
    print("getHotelsAvailability response returned");
    // RepositoryResponse response = await NetworkNAO.login(email, password);
    if (response.success) {
      response.data = AvailabilityHotelResponse.fromJson(response.data);

      _repositoryResponse.add(response);
    } else {
      _repositoryResponse.add(response);
    }
  }

  Stream<RepositoryResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}
