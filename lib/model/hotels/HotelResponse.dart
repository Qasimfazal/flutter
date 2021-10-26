import 'package:sould_food_guide/model/hotels/AuditData.dart';
import 'package:sould_food_guide/model/hotels/Error.dart';
import 'package:sould_food_guide/model/hotels/Hotels.dart';

class HotelResponse {
  AuditData auditData;
  Hotels hotels;
  Error error;

  HotelResponse({this.auditData, this.hotels});

  HotelResponse.fromJson(Map<String, dynamic> json) {
    auditData = json['auditData'] != null
        ? new AuditData.fromJson(json['auditData'])
        : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;

    hotels =
        json['hotels'] != null ? new Hotels.fromJson(json['hotels']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auditData != null) {
      data['auditData'] = this.auditData.toJson();
    }
    if (this.hotels != null) {
      data['hotels'] = this.hotels.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }
}
