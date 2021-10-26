class CancellationPolicies {
  String amount;
  String from;
  String hotelAmount;
  String hotelCurrency;

  CancellationPolicies(
      {this.amount, this.from, this.hotelAmount, this.hotelCurrency});

  CancellationPolicies.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    from = json['from'];
    hotelAmount = json['hotelAmount'];
    hotelCurrency = json['hotelCurrency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['from'] = this.from;
    data['hotelAmount'] = this.hotelAmount;
    data['hotelCurrency'] = this.hotelCurrency;
    return data;
  }
}