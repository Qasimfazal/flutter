import 'dart:async';
import 'dart:convert';

import 'package:sould_food_guide/model/User.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';

class ProfileRepository {
  AppPreferences _appPreferences;
  var _repositoryResponse = StreamController<RepositoryResponse>.broadcast();

  factory ProfileRepository({AppPreferences appPreferences}) =>
      ProfileRepository._internal(appPreferences);

  ProfileRepository._internal(this._appPreferences);

  Future<void> updateProfilePic(String imagePath) async {
    _appPreferences.getUserToken().then((value) async {
      RepositoryResponse response =
          await NetworkNAO.updatePic(imagePath, value);
      if (response.success)
        _appPreferences.setUserData(
            data: jsonEncode(User.fromJson(response.data)));

      _repositoryResponse.add(response);
    });
  }

  Future<void> updateProfile(
      String name, String phone, String dob, String address) async {
    _appPreferences.getUserToken().then((value) async {
      print("token $value");
      RepositoryResponse response =
          await NetworkNAO.updateProfile(name, phone, dob, address, value);
      if (response.success)
        _appPreferences.setUserData(
            data: jsonEncode(User.fromJson(response.data)));

      _repositoryResponse.add(response);
    });
  }

  Stream<RepositoryResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}
