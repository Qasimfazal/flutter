import 'dart:async';
import 'package:meta/meta.dart';
import 'package:sould_food_guide/model/LoginResponse.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';

class UserRepository {
  AppPreferences _appPreferences;
  var _repositoryResponse = StreamController<LoginResponse>.broadcast();

  factory UserRepository({@required AppPreferences appPreferences}) =>
      UserRepository._internal(appPreferences);

  UserRepository._internal(this._appPreferences);
  void login(String email, String password){
    LoginResponse loginResponse = new LoginResponse();
    loginResponse.success= false;
    NetworkNAO.login(email, password).then((data){
      loginResponse.fromJson(data);
      print("success " + loginResponse.success.toString());
      _repositoryResponse.add(loginResponse);

    });
  }
  Stream<LoginResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}