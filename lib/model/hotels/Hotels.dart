import 'package:sould_food_guide/model/hotels/Hotel.dart';

class Hotels {
  List<Hotel> hotels;
  String checkIn;
  int total;
  String checkOut;

  Hotels({this.hotels, this.checkIn, this.total, this.checkOut});

  Hotels.fromJson(Map<String, dynamic> json) {
    if (json['hotels'] != null) {
      hotels = new List<Hotel>();
      json['hotels'].forEach((v) {
        hotels.add(new Hotel.fromJson(v));
      });
    }
    checkIn = json['checkIn'];
    total = json['total'];
    checkOut = json['checkOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotels != null) {
      data['hotels'] = this.hotels.map((v) => v.toJson()).toList();
    }
    data['checkIn'] = this.checkIn;
    data['total'] = this.total;
    data['checkOut'] = this.checkOut;
    return data;
  }
}
