class User {
  String name;
  String phone;
  String email;
  String address;
  String dob;
  String profilePicture;

  User({this.name, this.phone, this.email, this.address, this.profilePicture,this.dob});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    dob = json['dob'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['dob'] = this.dob;
    data['profile_picture'] = this.profilePicture;

    return data;
  }
}
