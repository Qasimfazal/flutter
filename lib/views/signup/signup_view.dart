import 'dart:async';
import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sould_food_guide/app/app.dart';
import 'package:sould_food_guide/app/app_routes.dart';
import 'package:sould_food_guide/util/ToastUtil.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:sould_food_guide/util/constants.dart';
import 'package:sould_food_guide/util/image_pickup.dart';
import 'package:sould_food_guide/views/main_view.dart';
import 'package:sould_food_guide/views/signup/signup_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupViewModel _signupViewModel;
  StreamController _signupController;
  BuildContext context;
  bool _showLoader = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  String path=null;

  @override
  void initState() {

    super.initState();

    _signupController = new StreamController<bool>.broadcast();
    _signupController.sink.add(false);
    _signupViewModel = new SignupViewModel(App());
    observeViewModel();
  }

  void observeViewModel() {
    _signupViewModel
        .getUserRepository()
        .getRepositoryResponse()
        .listen((response) {
      // print("response code " + response.code.toString());

      if (mounted)
        setState(() {
          _showLoader = false;
        });
      if (response.code == null) {
        if (response.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.APP_ROUTE_LOGIN, (route) => false);
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

  void callSignUpApi() {
    if(path==null){
      ToastUtil.showToast(context, "Please select profile pic.");
      return;
    }
    if (nameController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Full Name can't be blank.");
      return;
    }
    if (emailController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Email can't be blank.");
      return;
    }
    if (phoneController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Phone can't be blank.");
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      ToastUtil.showToast(context, "Password can't be blank.");
      return;
    }

    if (mounted)
      setState(() {
        _showLoader = true;
      });

    _signupViewModel.signup(
        nameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        passwordController.text,path);
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
          path = image.path;
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
          path = image.path;
        }
      });
    }
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
            "Create Account".toUpperCase(),
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
                    child: path==null ?Ink.image(
                      image: AssetImage("assets/placeholder.png"),
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      child: InkWell(onTap: () {



                      }),
                    ):Image.file(File(path),width: 80,height: 80,fit: BoxFit.cover,),
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
            controller: emailController,
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
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: Util.getFormDecoration("Password"),
          ),
        ),
        InkWell(
          onTap: () {
            // Util.open(context, MainScreen());
            callSignUpApi();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            decoration: Util.getPrimaryButtonDecoration(),
            child: Center(
              child: Text(
                "sign up".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Util.popBack(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Center(
              child: Text.rich(TextSpan(
                  text: "Already Have an Account? ",
                  style: TextStyle(
                      color: Color(0XFF9E9E9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Color(0XFFFF8106),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))
                  ])),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ModalProgressHUD(inAsyncCall: _showLoader,child: body)),
    );
  }

  @override
  void dispose() {
    print("login dispose");
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
