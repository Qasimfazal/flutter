import 'package:sould_food_guide/model/hotels/availability/AuditData.dart';
import 'package:sould_food_guide/model/hotels/availability/Error.dart';
import 'package:sould_food_guide/model/hotels/availability/Hotels.dart';

class AvailabilityHotelResponse {
  AuditData auditData;
  Hotels hotels;
  Error error;
  String errorMsg;

  AvailabilityHotelResponse({this.auditData, this.hotels});

  AvailabilityHotelResponse.fromJson(Map<String, dynamic> json) {
    auditData = json['auditData'] != null
        ? new AuditData.fromJson(json['auditData'])
        : null;
    if (json['error'] is String) {
      errorMsg = json['error'];
    } else
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
    } else
      data['error'] = this.errorMsg;
    return data;
  }
}
