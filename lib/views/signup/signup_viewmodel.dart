import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/repository/user_respository.dart';

class SignupViewModel {
  UserRepository _userRepository;
  static SignupViewModel _instance;

  factory SignupViewModel(App app) {
    _instance ??= SignupViewModel._internal(
        userRepository: app.getUserRepository(app.getAppPreferences()));
    return _instance;
  }

  SignupViewModel._internal({@required UserRepository userRepository}) {
    _userRepository = userRepository;
  }

  void signup(String name,String email, String phone,String password) {
    _userRepository.signUp(name,email, password,phone);
  }

  UserRepository getUserRepository() => _userRepository;
}
