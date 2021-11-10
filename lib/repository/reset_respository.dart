import 'dart:async';

import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/network/nao/network_nao.dart';
import 'package:sould_food_guide/preference/app_preferences.dart';

class ResetRepository {
  AppPreferences _appPreferences;
  var _repositoryResponse = StreamController<RepositoryResponse>.broadcast();

  factory ResetRepository({AppPreferences appPreferences}) =>
      ResetRepository._internal(appPreferences);

  ResetRepository._internal(this._appPreferences);

  Future<void> forgot(String email) async {
    RepositoryResponse response = await NetworkNAO.forgotPassword(email);
    if (response.success) {
      // _appPreferences.setUserToken(userToken: response.data["token"]);
      // _appPreferences.setUserData(
      //     data: jsonEncode(User.fromJson(response.data["user"])));

      _repositoryResponse.add(response);
    } else {
      _repositoryResponse.add(response);
    }
  }

  Future<void> resetPassword(
      String code, String password, String confirmPassword) async {
    RepositoryResponse response =
        await NetworkNAO.resetPassword(code, password, confirmPassword);
    _repositoryResponse.add(response);
  }


  Stream<RepositoryResponse> getRepositoryResponse() {
    return _repositoryResponse.stream;
  }
}
