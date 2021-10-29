import 'package:sould_food_guide/model/hotels/availability/Error.dart';

class HotelDetailResponse {
  HotelDetail hotel;
  Error error;
  String errorMsg;

  HotelDetailResponse({this.hotel});

  HotelDetailResponse.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? new HotelDetail.fromJson(json['hotel']) : null;
    if (json['error'] is String) {
      errorMsg = json['error'];
    } else
      error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error.toJson();
    } else
      data['error'] = this.errorMsg;
    return data;
  }
}

class HotelDetail {
  List<HotelFacilities> facilities;

  HotelDetail({this.facilities});

  HotelDetail.fromJson(Map<String, dynamic> json) {
    if (json['facilities'] != null) {
      facilities = new List<HotelFacilities>();
      json['facilities'].forEach((v) {
        facilities.add(new HotelFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.facilities != null) {
      data['facilities'] = this.facilities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelFacilities {
  int facilityCode;
  int facilityGroupCode;
  Description description;
  int order;
  bool indYesOrNo;
  int number;
  bool voucher;
  bool indLogic;
  bool indFee;
  int distance;
  String timeFrom;
  String timeTo;

  HotelFacilities(
      {this.facilityCode,
        this.facilityGroupCode,
        this.description,
        this.order,
        this.indYesOrNo,
        this.number,
        this.voucher,
        this.indLogic,
        this.indFee,
        this.distance,
        this.timeFrom,
        this.timeTo});

  HotelFacilities.fromJson(Map<String, dynamic> json) {
    facilityCode = json['facilityCode'];
    facilityGroupCode = json['facilityGroupCode'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    order = json['order'];
    indYesOrNo = json['indYesOrNo'];
    number = json['number'];
    voucher = json['voucher'];
    indLogic = json['indLogic'];
    indFee = json['indFee'];
    distance = json['distance'];
    timeFrom = json['timeFrom'];
    timeTo = json['timeTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityCode'] = this.facilityCode;
    data['facilityGroupCode'] = this.facilityGroupCode;
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    data['order'] = this.order;
    data['indYesOrNo'] = this.indYesOrNo;
    data['number'] = this.number;
    data['voucher'] = this.voucher;
    data['indLogic'] = this.indLogic;
    data['indFee'] = this.indFee;
    data['distance'] = this.distance;
    data['timeFrom'] = this.timeFrom;
    data['timeTo'] = this.timeTo;
    return data;
  }
}

class Description {
  String content;

  Description({this.content});

  Description.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}