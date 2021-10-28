import 'package:sould_food_guide/model/hotels/availability/Error.dart';
import 'package:sould_food_guide/model/hotels/content/AuditData.dart';
import 'package:sould_food_guide/model/hotels/content/Hotels.dart';

class ContentHotelResponse {
  int from;
  int to;
  int total;
  AuditData auditData;
  List<Hotels> hotels;
  Error error;
  String errorMsg;

  ContentHotelResponse(
      {this.from, this.to, this.total, this.auditData, this.hotels});

  ContentHotelResponse.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    total = json['total'];
    auditData = json['auditData'] != null
        ? new AuditData.fromJson(json['auditData'])
        : null;
    if (json['error'] is String) {
      errorMsg = json['error'];
    } else
      error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    if (json['hotels'] != null) {
      hotels = new List<Hotels>();
      json['hotels'].forEach((v) {
        hotels.add(new Hotels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['total'] = this.total;
    if (this.auditData != null) {
      data['auditData'] = this.auditData.toJson();
    }
    if (this.hotels != null) {
      data['hotels'] = this.hotels.map((v) => v.toJson()).toList();
    }
    if (this.error != null) {
      data['error'] = this.error.toJson();
    } else
      data['error'] = this.errorMsg;
    return data;
  }
}