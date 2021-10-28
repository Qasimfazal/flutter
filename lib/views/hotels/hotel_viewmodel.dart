import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/network/network_config.dart';
import 'package:sould_food_guide/repository/hotel_respository.dart';
import 'package:sould_food_guide/util/Util.dart';

class HotelViewModel {
  HotelRepository _hotelRepository;
  static HotelViewModel _instance;

  factory HotelViewModel(App app) {
    _instance ??= HotelViewModel._internal(
        HotelRepository: app.getHotelRepository(app.getAppPreferences()));
    return _instance;
  }

  HotelViewModel._internal({@required HotelRepository HotelRepository}) {
    _hotelRepository = HotelRepository;
  }


  HotelRepository getHotelRepository() => _hotelRepository;
}
