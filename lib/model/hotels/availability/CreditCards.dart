
class CreditCards {
  String code;
  String name;
  String paymentType;

  CreditCards({this.code, this.name, this.paymentType});

  CreditCards.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    paymentType = json['paymentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['paymentType'] = this.paymentType;
    return data;
  }
}