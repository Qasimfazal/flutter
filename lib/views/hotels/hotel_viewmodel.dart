import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/network/network_config.dart';
import 'package:sould_food_guide/repository/hotel_respository.dart';

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

  void getHotels(
      String checkIn,
      String checkOut,
      int rooms,
      int adults,
      int children,
      double latitude,
      double longitude,
      int radius,
      String unit) {
    int time = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
    var assemble = (NetworkConfig.HOTEL_API_KEY +
        NetworkConfig.HOTEL_SECRET + time.toString());
    var encoded = utf8.encode(assemble);
    var encrypt = sha256.convert(encoded);
    _hotelRepository.getHotels(checkIn, checkOut, rooms, adults, children,
        latitude, longitude, radius, unit, encrypt.toString());
  }

  HotelRepository getHotelRepository() => _hotelRepository;
}
