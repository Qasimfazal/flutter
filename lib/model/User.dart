class User {
  String name;
  String phone;
  String email;
  String address;
  String profile_picture;

  User({this.name, this.phone, this.email, this.address, this.profile_picture});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    profile_picture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['profile_picture'] = this.profile_picture;

    return data;
  }
}
