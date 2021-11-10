import 'package:sould_food_guide/model/User.dart';

class LoginResponse {
  bool success;
  String message;
  User data;

  LoginResponse({this.success, this.message, this.data});

  fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}
// class Data{
//   String apiToken;
//   String name;
//
//   Data({this.apiToken, this.name});
//   Data.fromJson(Map<String, dynamic> json) {
//     apiToken = json['token'];
//     name  = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.apiToken;
//     data["name"] = this.name;
//
//     return data;
//   }
// }
