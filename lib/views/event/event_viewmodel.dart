import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/network/network_config.dart';
import 'package:sould_food_guide/repository/event_respository.dart';
import 'package:sould_food_guide/repository/hotel_respository.dart';
import 'package:sould_food_guide/util/Util.dart';

class EventViewModel {
  EventRepository _eventRepository;
  static EventViewModel _instance;

  factory EventViewModel(App app) {
    _instance ??= EventViewModel._internal(
        eventRepository: app.getEventRepository(app.getAppPreferences()));
    return _instance;
  }

  EventViewModel._internal({@required EventRepository eventRepository}) {
    _eventRepository = eventRepository;
  }


  EventRepository getEventRepository() => _eventRepository;
}
