class Offers {
  String code;
  String name;
  String amount;

  Offers({this.code, this.name, this.amount});

  Offers.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}
