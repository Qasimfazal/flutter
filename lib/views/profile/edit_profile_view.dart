import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/util/constants.dart';
import 'package:sould_food_guide/util/image_pickup.dart';
import 'package:sould_food_guide/views/profile/profile_viewmodel.dart';
import 'package:sould_food_guide/views/signup/signup_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>  with WidgetsBindingObserver  {
  ProfileViewModel _profileViewModel;
  StreamController _dobStreamController;
  bool _showLoader = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
final dobController = TextEditingController();
  // final passwordController = TextEditingController();
  final addressController = TextEditingController();

  String photo;
  DateTime selectedDate = DateTime.now();
  DateTime dobDate;
BuildContext context;

  StreamSubscription profileStreamSubscription;
  @override
  void initState() {
    super.initState();

    _dobStreamController = new StreamController<bool>.broadcast();
    _profileViewModel = new ProfileViewModel(App());
    observeViewModel();
    getUserData();
    WidgetsBinding.instance.addObserver(this);
  }

  void getUserData() {
    App().getAppPreferences().isPreferenceReady;
    App().getAppPreferences().getUserData().then((value) {
      setState(() {
        nameController.text = value.name;
        emailController.text = value.email;
        phoneController.text = value.phone;
        addressController.text = value.address;
        if(value.dob!=null  && value.dob.isNotEmpty){
          dobController.text = value.dob;
          dobDate = DateTime.parse(value.dob);
        }

        photo = value.profilePicture;

        // userName = value.firstname;
      });
    });
  }

  void observeViewModel() {
   profileStreamSubscription = _profileViewModel
        .getProfileRepository()
        .getRepositoryResponse()
        .listen((response) {
      // print("response code " + response.code.toString());

      if (mounted)
        setState(() {
          _showLoader = false;
        });
      if (response.code == null) {
        if (response.success) {
          ToastUtil.showToast(context, response.msg,
              toastGravity: ToastGravity.CENTER);
          Navigator.of(context).pop();
        } else {
          ToastUtil.showToast(context, response.msg,
              toastGravity: ToastGravity.CENTER);
        }
      } else {
        ToastUtil.showToast(context, response.msg);
      }

      // print(response);
    });
  }

  void callUpdateApi() {
    if (nameController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Full Name can't be blank.");
      return;
    }
    if (phoneController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Phone can't be blank.");
      return;
    }
    if(dobDate ==null){
      ToastUtil.showToast(context, "DOB can't be blank.");
      return;
    }
    if (addressController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Address can't be blank.");
      return;
    }
    if (mounted)
      setState(() {
        _showLoader = true;
      });
_profileViewModel.updateProfile(nameController.text.trim(), phoneController.text.trim(), dobController.text.trim(), addressController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final body = ListView(
      children: [
        Util.getBack(context),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "Edit Profile".toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: photo == null
                        ? Ink.image(
                            image: AssetImage("assets/placeholder.png"),
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            child: InkWell(onTap: () {}),
                          )
                        : Image.network(
                            photo,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null)
                                return child;
                              else
                                return Container(
                                  width: 80,height: 80,
                                    child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ));
                            },
                            errorBuilder: (context, error, strackTrace) {
                              return Image.asset(
                                "assets/placeholder.png",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              );
                            },
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: (){
                      getImage(context: context,selectCamera: selectCamera,selectGallery: selectGallery);
                    },
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: Util.getPrimaryBtnGradient(),
                        ),
                        padding: EdgeInsets.all(6),
                        child: SvgPicture.asset("assets/ic_camera.svg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: Util.getFormDecoration("Full Name"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            readOnly: true,
            controller: emailController,
            enableInteractiveSelection: true,
            keyboardType: TextInputType.emailAddress,
            decoration: Util.getFormDecoration("Email Address"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: Util.getFormDecoration("Phone Number"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            readOnly: true,
            onTap: (){
              print("dsfasdf");
              _selectDate(context);
            },
            controller: dobController,
            enableInteractiveSelection: true,
            decoration: Util.getFormDecoration("DOB"),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: addressController,
            keyboardType: TextInputType.text,
            decoration: Util.getFormDecoration("Address"),
          ),
        ),
        InkWell(
          onTap: () {
            // Util.open(context, MainScreen());
            callUpdateApi();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "save".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     Util.popBack(context);
        //   },
        //   child: Container(
        //     margin: EdgeInsets.only(bottom: 10, top: 20),
        //     child: Center(
        //       child: Text.rich(TextSpan(
        //           text: "Already Have an Account? ",
        //           style: TextStyle(
        //               color: Color(0XFF9E9E9E),
        //               fontSize: 14,
        //               fontWeight: FontWeight.w400),
        //           children: [
        //             TextSpan(
        //                 text: "Login",
        //                 style: TextStyle(
        //                     color: Color(0XFFFF8106),
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.w500))
        //           ])),
        //     ),
        //   ),
        // ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ModalProgressHUD(inAsyncCall: _showLoader, child: body)),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: selectedDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      dobDate = picked;
      dobController.text ="${dobDate.year}-${dobDate.month}-${dobDate.day}";
      // _dobStreamController.sink.add(true);
    }
  }

  Future selectGallery(param) async {
    var permissionStatus =
    await Util.getPermission(Constants.galleryPermissionValue);
    if (permissionStatus) {

      var image = await ImagePicker().getImage(
        // var image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 40);

      setState(() {
        if (image != null) {
          callUpdatePicApi(image.path);
          // path = image.path;
          // List<int> imageBytes = image.readAsBytesSync();
          // if (param == 'shop') {
          //   shopImage = base64Encode(imageBytes);
          //   qParams['shop_image'] = 'data:image/jpeg;base64,' + shopImage;
          // } else if (param == 'bill') {
          //   billImage = base64Encode(imageBytes);
          //   qParams['bill_image'] = 'data:image/jpeg;base64,' + billImage;
          // } else if (param == 'invoice') {
          //   invoiceImage = base64Encode(imageBytes);
          //   qParams['invoice_image'] = 'data:image/jpeg;base64,' + invoiceImage;
          // }
        }
      });
    }
  }

  Future selectCamera(param) async {
    var permissionStatus =
    await Util.getPermission(Constants.cameraPermissionValue);
    if (permissionStatus) {
      var image = await ImagePicker().getImage(
          source: ImageSource.camera, imageQuality: 40);
      setState(() {
        if (image != null) {
          callUpdatePicApi(image.path);
          // path = image.path;

        }
      });
    }
  }
  @override
  void dispose() {
    print("dispose");
    profileStreamSubscription.cancel();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    // _dobStreamController.close();
    // passwordController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void callUpdatePicApi(String imagePath) {

    if (mounted)
      setState(() {
        _showLoader = true;
      });
    _profileViewModel.updateProfilePic(imagePath);
  }
}
