import 'dart:async';

import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';

class HotelRepository {
  AppPreferences _appPreferences;
  var _repositoryResponse = StreamController<RepositoryResponse>.broadcast();

  factory HotelRepository({AppPreferences appPreferences}) =>
      HotelRepository._internal(appPreferences);

  HotelRepository._internal(this._appPreferences);

  Future<void> getHotels(
      String checkIn,
      String checkOut,
      int rooms,
      int adults,
      int children,
      double latitude,
      double longitude,
      int radius,
      String unit,String signature) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;

    RepositoryResponse response = await NetworkNAO.getHotels(
checkIn,
        checkOut,
        rooms,
        adults,
        children,
        latitude,
        longitude,
        radius,
        unit,signature);
    // RepositoryResponse response = await NetworkNAO.login(email, password);
    if (response.success) {


      _repositoryResponse.add(response);
    } else {

      _repositoryResponse.add(response);
    }
  }

  Stream<RepositoryResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}
