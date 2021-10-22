
class User {
  String customerId;
  String customerGroupId;
  String storeId;
  String firstname;
  String lastname;
  String email;
  String telephone;
  String addressId;
  String status;
  String token;
  String code;

  User(
      {this.customerId,
        this.customerGroupId,
        this.storeId,
        this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.addressId,
        this.status,
        this.token,
        this.code});

  User.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerGroupId = json['customer_group_id'];
    storeId = json['store_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    addressId = json['address_id'];
    status = json['status'];
    token = json['token'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_group_id'] = this.customerGroupId;
    data['store_id'] = this.storeId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['address_id'] = this.addressId;
    data['status'] = this.status;
    data['token'] = this.token;
    data['code'] = this.code;
    return data;
  }
}