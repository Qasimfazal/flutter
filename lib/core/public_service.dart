import 'package:flutter/cupertino.dart';
import 'package:sould_food_guide/model/hotels/content/Hotels.dart';

class PublicService extends ChangeNotifier {
  dynamic _checkIn;
  dynamic _checkOut;
  dynamic _guests;
  dynamic _childrens;
  dynamic _rooms;
  dynamic _lat;
  dynamic _long;
  dynamic _rateKey;
  dynamic _address;
  var _currency;

  var _rate;

  get checkIn => _checkIn;
  get checkOut => _checkOut;
  get guests => _guests;
  get childrens => _childrens;
  get rooms => _rooms;
  get lat => _lat;
  get long => _long;
  get rateKey => _rateKey;
  get address => _address;
  get currency => _currency;
  get rate => _rate;

  searchedField({Map data}) {
    _checkIn = data['checkIn'];
    _checkOut = data['checkOut'];
    _guests = data['guest'];
    _childrens = data['child'];
    _rooms = data['rooms'];
    _long = data['lng'];
    _lat = data['lat'];

    notifyListeners();
  }

  setKeys(data, address, currency, rate) {
    _rateKey = data;
    _address = address;
    _currency = currency;
    _rate = rate;
    notifyListeners();
  }
}
