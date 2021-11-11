import 'package:meta/meta.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/repository/profile_respository.dart';
import 'package:sould_food_guide/repository/reset_respository.dart';
import 'package:sould_food_guide/repository/user_respository.dart';

class ProfileViewModel {
  ProfileRepository _profileRepository;
  static ProfileViewModel _instance;

  factory ProfileViewModel(App app) {
    _instance ??= ProfileViewModel._internal(
        profileRepository: app.getProfileRepository(app.getAppPreferences()));
    return _instance;
  }

  ProfileViewModel._internal({@required ProfileRepository profileRepository}) {
    _profileRepository = profileRepository;
  }

  void updateProfile(String name,String phone,String dob,String address) {
    _profileRepository.updateProfile(name, phone, dob, address);
  }
  void updateProfilePic(String imagePath){
    _profileRepository.updateProfilePic(imagePath);
  }


  ProfileRepository getProfileRepository() => _profileRepository;
}
