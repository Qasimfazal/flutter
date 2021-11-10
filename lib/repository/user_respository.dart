import 'dart:async';
import 'dart:convert';

import 'package:sould_food_guide/model/User.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';

class UserRepository {
  AppPreferences _appPreferences;
  var _repositoryResponse = StreamController<RepositoryResponse>.broadcast();

  factory UserRepository({AppPreferences appPreferences}) =>
      UserRepository._internal(appPreferences);

  UserRepository._internal(this._appPreferences);

  Future<void> login(String email, String password) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;

    RepositoryResponse response = await NetworkNAO.login(email, password);
    if (response.success) {
      _appPreferences.setUserToken(userToken: response.data["token"]);
      _appPreferences.setUserData(
          data: jsonEncode(User.fromJson(response.data)));

      _repositoryResponse.add(response);
    } else {
      _repositoryResponse.add(response);
    }
  }

  Future<void> signUp(
      String name, String email, String password, String phone) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    RepositoryResponse response =
        await NetworkNAO.signUp(name, email, password, phone);
    if (response.success)
      _repositoryResponse.add(response);
    else
      _repositoryResponse.add(response);
  }

  Stream<RepositoryResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}
