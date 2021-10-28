

import 'package:sould_food_guide/model/hotels/availability/Rates.dart';

class Rooms {
  String code;
  String name;
  List<Rates> rates;

  Rooms({this.code, this.name, this.rates});

  Rooms.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    if (json['rates'] != null) {
      rates = new List<Rates>();
      json['rates'].forEach((v) {
        rates.add(new Rates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.rates != null) {
      data['rates'] = this.rates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}