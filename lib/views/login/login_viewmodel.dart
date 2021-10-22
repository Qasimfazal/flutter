import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/repository/user_respository.dart';

class LoginViewModel {
  UserRepository _userRepository;
  static LoginViewModel _instance;

  factory LoginViewModel(App app) {
    _instance ??= LoginViewModel._internal(
        userRepository: app.getUserRepository(app.getAppPreferences()));
    return _instance;
  }

  LoginViewModel._internal({@required UserRepository userRepository}) {
    _userRepository = userRepository;
  }

  void login(String email, String password) {
    _userRepository.login(email, password);
  }

  UserRepository getUserRepository() => _userRepository;
}
