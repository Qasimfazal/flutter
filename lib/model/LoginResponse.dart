import 'package:sould_food_guide/model/User.dart';

class LoginResponse {
  bool success;
  String message;
  Data data;

  LoginResponse({this.success, this.message, this.data});

  fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
class Data{
  String apiToken;
  User user;

  Data({this.apiToken, this.user});
  Data.fromJson(Map<String, dynamic> json) {
    apiToken = json['api_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_token'] = this.apiToken;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
