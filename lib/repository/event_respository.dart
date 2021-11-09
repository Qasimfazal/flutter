import 'dart:async';

import 'package:sould_food_guide/model/event/EventResponse.dart';
import 'package:sould_food_guide/model/hotels/detail/HotelDetailResponse.dart';
import 'package:sould_food_guide/model/hotels/detail/Hotel_detail_model.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';
// import 'package:rxdart/rxdart.dart';

class EventRepository {
  AppPreferences _appPreferences;

  // var _availabilityResponse = StreamController<RepositoryResponse>.broadcast();
  // var _hotelResponse = StreamController<RepositoryResponse>.broadcast();
  StreamController<RepositoryResponse> _repositoryResponse =
      StreamController.broadcast();

  factory EventRepository({AppPreferences appPreferences}) =>
      EventRepository._internal(appPreferences);

  EventRepository._internal(this._appPreferences);

  Future<void> getEvents(String city,int page) async {
    RepositoryResponse response = await NetworkNAO.getEvents(city, page);
    try {
      EventResponse eventResponse = EventResponse.fromJson(response.data);

      // HotelDetailModel pojo = HotelDetailModel.fromJson(response.data);
      if (response.success) {
        response.data = eventResponse;
        _repositoryResponse.add(response);
      } else {
        _repositoryResponse.add(response);
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());
      print("event repository error " + e.toString());
      EventResponse eventResponse = EventResponse();
      eventResponse.fault.faultstring = e.toString();
      response.data =eventResponse;
      response.success = false;
      response.msg = e.toString();
      _repositoryResponse.add(response);
    }
  }

  Stream<RepositoryResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}
