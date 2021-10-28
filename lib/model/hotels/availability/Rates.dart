import 'package:sould_food_guide/model/hotels/availability/CancellationPolicies.dart';
import 'package:sould_food_guide/model/hotels/availability/Offers.dart';
import 'package:sould_food_guide/model/hotels/availability/Promotions.dart';


class Rates {
  String rateKey;
  String rateClass;
  String rateType;
  String net;
  int allotment;
  String rateCommentsId;
  String paymentType;
  bool packaging;
  String boardCode;
  String boardName;
  List<CancellationPolicies> cancellationPolicies;
  int rooms;
  int adults;
  int children;
  List<Promotions> promotions;
  List<Offers> offers;
  String sellingRate;
  String hotelSellingRate;
  String hotelCurrency;
  bool hotelMandatory;
  String commission;
  String commissionVAT;
  String commissionPCT;

  Rates(
      {this.rateKey,
        this.rateClass,
        this.rateType,
        this.net,
        this.allotment,
        this.rateCommentsId,
        this.paymentType,
        this.packaging,
        this.boardCode,
        this.boardName,
        this.cancellationPolicies,
        this.rooms,
        this.adults,
        this.children,
        this.promotions,
        this.offers,
        this.sellingRate,
        this.hotelSellingRate,
        this.hotelCurrency,
        this.hotelMandatory,
        this.commission,
        this.commissionVAT,
        this.commissionPCT});

  Rates.fromJson(Map<String, dynamic> json) {
    rateKey = json['rateKey'];
    rateClass = json['rateClass'];
    rateType = json['rateType'];
    net = json['net'];
    allotment = json['allotment'];
    rateCommentsId = json['rateCommentsId'];
    paymentType = json['paymentType'];
    packaging = json['packaging'];
    boardCode = json['boardCode'];
    boardName = json['boardName'];
    if (json['cancellationPolicies'] != null) {
      cancellationPolicies = new List<CancellationPolicies>();
      json['cancellationPolicies'].forEach((v) {
        cancellationPolicies.add(new CancellationPolicies.fromJson(v));
      });
    }
    rooms = json['rooms'];
    adults = json['adults'];
    children = json['children'];
    if (json['promotions'] != null) {
      promotions = new List<Promotions>();
      json['promotions'].forEach((v) {
        promotions.add(new Promotions.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
    sellingRate = json['sellingRate'];
    hotelSellingRate = json['hotelSellingRate'];
    hotelCurrency = json['hotelCurrency'];
    hotelMandatory = json['hotelMandatory'];
    commission = json['commission'];
    commissionVAT = json['commissionVAT'];
    commissionPCT = json['commissionPCT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rateKey'] = this.rateKey;
    data['rateClass'] = this.rateClass;
    data['rateType'] = this.rateType;
    data['net'] = this.net;
    data['allotment'] = this.allotment;
    data['rateCommentsId'] = this.rateCommentsId;
    data['paymentType'] = this.paymentType;
    data['packaging'] = this.packaging;
    data['boardCode'] = this.boardCode;
    data['boardName'] = this.boardName;
    if (this.cancellationPolicies != null) {
      data['cancellationPolicies'] =
          this.cancellationPolicies.map((v) => v.toJson()).toList();
    }
    data['rooms'] = this.rooms;
    data['adults'] = this.adults;
    data['children'] = this.children;
    if (this.promotions != null) {
      data['promotions'] = this.promotions.map((v) => v.toJson()).toList();
    }
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    data['sellingRate'] = this.sellingRate;
    data['hotelSellingRate'] = this.hotelSellingRate;
    data['hotelCurrency'] = this.hotelCurrency;
    data['hotelMandatory'] = this.hotelMandatory;
    data['commission'] = this.commission;
    data['commissionVAT'] = this.commissionVAT;
    data['commissionPCT'] = this.commissionPCT;
    return data;
  }
}