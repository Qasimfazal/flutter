import 'package:sould_food_guide/model/hotels/availability/CreditCards.dart';
import 'package:sould_food_guide/model/hotels/availability/Rooms.dart';

class Hotel {
  int code;
  String name;
  String categoryCode;
  String categoryName;
  String destinationCode;
  String destinationName;
  int zoneCode;
  String zoneName;
  String latitude;
  String longitude;
  List<Rooms> rooms;
  String minRate;
  String maxRate;
  String currency;
  List<CreditCards> creditCards;

  Hotel(
      {this.code,
        this.name,
        this.categoryCode,
        this.categoryName,
        this.destinationCode,
        this.destinationName,
        this.zoneCode,
        this.zoneName,
        this.latitude,
        this.longitude,
        this.rooms,
        this.minRate,
        this.maxRate,
        this.currency,
        this.creditCards});

  Hotel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    categoryCode = json['categoryCode'];
    categoryName = json['categoryName'];
    destinationCode = json['destinationCode'];
    destinationName = json['destinationName'];
    zoneCode = json['zoneCode'];
    zoneName = json['zoneName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['rooms'] != null) {
      rooms = new List<Rooms>();
      json['rooms'].forEach((v) {
        rooms.add(new Rooms.fromJson(v));
      });
    }
    minRate = json['minRate'];
    maxRate = json['maxRate'];
    currency = json['currency'];
    if (json['creditCards'] != null) {
      creditCards = new List<CreditCards>();
      json['creditCards'].forEach((v) {
        creditCards.add(new CreditCards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['categoryCode'] = this.categoryCode;
    data['categoryName'] = this.categoryName;
    data['destinationCode'] = this.destinationCode;
    data['destinationName'] = this.destinationName;
    data['zoneCode'] = this.zoneCode;
    data['zoneName'] = this.zoneName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.rooms != null) {
      data['rooms'] = this.rooms.map((v) => v.toJson()).toList();
    }
    data['minRate'] = this.minRate;
    data['maxRate'] = this.maxRate;
    data['currency'] = this.currency;
    if (this.creditCards != null) {
      data['creditCards'] = this.creditCards.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  String toString() {

    return code.toString();
  }
}