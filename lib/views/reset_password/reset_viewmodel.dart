import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/repository/reset_respository.dart';
import 'package:sould_food_guide/repository/user_respository.dart';

class ResetViewModel {
  ResetRepository _resetRepository;
  static ResetViewModel _instance;

  factory ResetViewModel(App app) {
    _instance ??= ResetViewModel._internal(
        resetRepository: app.getResetRepository(app.getAppPreferences()));
    return _instance;
  }

  ResetViewModel._internal({@required ResetRepository resetRepository}) {
    _resetRepository = resetRepository;
  }

  void forgot(String email) {
    _resetRepository.forgot(email);
  }
  void resetPassword(String code, String newPassword, String confirmPassword){
    _resetRepository.resetPassword(code, newPassword, confirmPassword);

  }

  ResetRepository getResetRepository() => _resetRepository;
}
