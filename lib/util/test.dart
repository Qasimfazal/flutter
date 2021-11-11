// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// /*import 'package:data_connection_checker/data_connection_checker.dart';*/
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:image_picker/image_picker.dart';
// import 'package:sould_food_guide/util/ToastUtil.dart';
// import 'package:sould_food_guide/util/Util.dart';
// import 'package:sould_food_guide/util/constants.dart';
//
// class VendorShopSettingsView extends StatefulWidget {
//   @override
//   _ShopSettingsViewScreenState createState() => _ShopSettingsViewScreenState();
// }
//
// Color BLACK_OPS_COLOR = Color(0xFF656565);
// Color GREEN_OPS_COLOR = Color(0xff01d318);
//
// class _ShopSettingsViewScreenState extends State<VendorShopSettingsView> {
//   StreamController _shopSettingsController;
//   StreamController _dataController;
//   String shopImage = null;
//   String billImage = null;
//   String invoiceImage = null;
//   bool isLoading = true;
//
//   String _selectedStartDate = 'Open Time';
//   String _selectedEndDate = 'Close Time';
//   String errorMsg = "";
//   bool _isInternetAvailable = true;
//
//   String selectedLatitude;
//
//   String selectedLongitude;
//
//   String selectedAddress;
//
//   TextEditingController numberController = new TextEditingController();
//   TextEditingController descriptionController = new TextEditingController();
//   TextEditingController shopDaysController = TextEditingController();
//
//   Map<String, String> qParams = {'openTime': '', 'closeTime': ''};
//
//   var selfDelivery;
//
//   var deliveryChargesController = new TextEditingController();
//
//   var _height = 0.0;
//   FocusNode myFocusNode;
//
//   dynamic deliveryCharges;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     // getVendorInfo();
//
//     myFocusNode = FocusNode();
//     //selfDelivery = 0;
//
//     shopDaysController.text = "Select Days";
//     _shopSettingsController = new StreamController<bool>.broadcast();
//     _shopSettingsController.sink.add(false);
//
//     _dataController = new StreamController<bool>.broadcast();
//     _dataController.sink.add(false);
//     subscribeToViewModel();
//     getVendorData();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//
//     // _viewModel.getVendorSettingsRepository().getShopDetails();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xff52D15D),
//         centerTitle: true,
//         title: new Text(
//           'Business Settings',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: "Helvetica",
//             color: Color(0xffffffff),
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             (Platform.isIOS) ? Icons.arrow_back_ios : Icons.arrow_back,
//             size: 20.0,
//             color: Colors.white,
//           ),
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Color(0xff52D15D), Color(0xff1FB838)],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Color(0xfff6f9f2),
//       body: StreamBuilder<bool>(
//           stream: _dataController.stream, builder: (context, snapshot) {}),
//     );
//   }
//
//   Widget buildDaysWidget(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Theme(
//         data: new ThemeData(
//           primaryColor: const Color(0xff444444),
//           primaryColorDark: const Color(0xff8c8c8c),
//         ),
//         child: Container(
//           height: 35,
//           child: TextFormField(
//             enableInteractiveSelection: false,
//             style: TextStyle(
//               fontFamily: "Helvetica",
//               color: const Color(0xff444444),
//             ),
//             controller: shopDaysController,
//             textAlign: TextAlign.start,
//             keyboardType: TextInputType.text,
//             autofocus: false,
//             decoration: InputDecoration(
//               enabledBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(32)),
//                 borderSide: const BorderSide(color: Colors.grey, width: 0.0),
//               ),
//               hintStyle: TextStyle(
//                   fontFamily: 'Helvetica', color: const Color(0xff8c8c8c)),
//               contentPadding: EdgeInsets.fromLTRB(16.0, 0.0, 5.0, 0.0),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(32.0),
//                 borderSide: const BorderSide(
//                     color: const Color(0xffD4D4D4), width: 1.0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 gapPadding: 0,
//                 borderRadius: BorderRadius.circular(32.0),
//                 borderSide: const BorderSide(
//                     color: const Color(0xff8c8c8c), width: 1.0),
//               ),
//               labelText: "Days",
//               labelStyle: TextStyle(
//                 color: Color(0xffaaaaaa),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildDaysNameItems(BuildContext context, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           var selectedDays = "";
//
//           if (selectedDays.length > 0)
//             shopDaysController.text =
//                 selectedDays.substring(1, selectedDays.length);
//           else
//             shopDaysController.text = "Select Days";
//         });
//       },
//       child: Container(
//           width: 50,
//           height: 50,
//           child: Center(
//             child:Container(),
//           )),
//     );
//   }
//
//   Widget buildMobileNumberWidget(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 1.5,
//       child: new Theme(
//         data: new ThemeData(
//           primaryColor: const Color(0xffffffff),
//           primaryColorDark: const Color(0xffffffff),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 blurRadius: 1,
//                 offset: Offset(0, 0), // changes position of shadow
//               ),
//             ],
//             color: Color(0xffFFFFFF),
//             border: Border.all(
//               width: 2.00,
//               color: Color(0xffFFFFFF),
//             ),
//             borderRadius: BorderRadius.circular(5.00),
//           ),
//           //       : BoxDecoration(
//           //   color: Color(0xfff2f2f2),
//           //   borderRadius: BorderRadius.circular(5.00),
//           // ),
//
//           child: TextFormField(
//             controller: numberController,
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp("[0-9]")),
//               FilteringTextInputFormatter.deny(RegExp("[abFeG]")),
//               new LengthLimitingTextInputFormatter(11),
//             ],
//             style: TextStyle(
//               fontFamily: "Helvetica",
//
//               color: const Color(0xff444444),
//             ),
//             textAlign: TextAlign.start,
//             keyboardType: TextInputType.number,
//             autofocus: false,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               errorBorder: InputBorder.none,
//               disabledBorder: InputBorder.none,
//               // hasFloatingPlaceholder: false,
//               floatingLabelBehavior: FloatingLabelBehavior.never,
//               // Hint to input box
//               labelText: "3001234567",
//               labelStyle: TextStyle(
//
//                 fontFamily: 'Helvetica',
//                 // color: Color(0xff444444)
//               ),
//               contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 17.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool checkMobileField(String mobileNumber) {
//     if (mobileNumber.isEmpty) {
//       ToastUtil.showToast(context, "Mobile number can not be empty");
//       return false;
//     }
//     if (mobileNumber.length < 11) {
//       ToastUtil.showToast(context, "Invalid mobile number");
//       return false;
//     }
//     return true;
//   }
//
//   Widget buildDescriptionWidget(BuildContext context) {
//     return Container(
//       child: new Theme(
//         data: new ThemeData(
//           primaryColor: const Color(0xffffffff),
//           primaryColorDark: const Color(0xffffffff),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 blurRadius: 1,
//                 offset: Offset(0, 0), // changes position of shadow
//               ),
//             ],
//             color: Color(0xffFFFFFF),
//             border: Border.all(
//               width: 2.00,
//               color: Color(0xffFFFFFF),
//             ),
//             borderRadius: BorderRadius.circular(5.00),
//           ),
//           child: TextFormField(
//             controller: descriptionController,
//             style: TextStyle(
//               fontFamily: "Helvetica",
//
//               color: const Color(0xff444444),
//             ),
//             onChanged: (val) {
//               qParams['description'] = descriptionController.text;
//               qParams['attribute'] = 'description';
//             },
//             maxLines: 4,
//             textAlign: TextAlign.start,
//             keyboardType: TextInputType.text,
//             autofocus: false,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               errorBorder: InputBorder.none,
//               disabledBorder: InputBorder.none,
//               // Hint to input box
//               hintText: "Description",
//               hintStyle: TextStyle(
//
//                   fontFamily: 'Helvetica',
//                   color: Color(0xff444444)),
//               contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 15.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildShopTimingWidget(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () async {
//               FocusScope.of(context).requestFocus(new FocusNode());
//               TimeOfDay picked = await showTimePicker(
//                 helpText: "Select Open Time",
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//                 builder: (BuildContext context, Widget child) {
//                   return Theme(
//                     data: ThemeData.light().copyWith(
//                       primaryColor: AppColors.APP_PRIMARY_COLOR,
//                       accentColor: AppColors.APP_PRIMARY_COLOR,
//                       colorScheme: ColorScheme.light(
//                         primary: AppColors.APP_PRIMARY_COLOR,
//                       ),
//                       buttonTheme:
//                           ButtonThemeData(textTheme: ButtonTextTheme.primary),
//                     ),
//                     child: MediaQuery(
//                         data: MediaQuery.of(context)
//                             .copyWith(alwaysUse24HourFormat: false),
//                         child: child),
//                   );
//                 },
//               );
//               if (picked != null) {
//                 setState(() {
//                   _selectedStartDate = picked.format(context).trim();
//                   MaterialLocalizations localization =
//                       MaterialLocalizations.of(context);
//                   qParams['openTime'] = localization.formatTimeOfDay(picked,
//                       alwaysUse24HourFormat: true);
//                 });
//               }
//             },
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.43,
//
//               padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     blurRadius: 1,
//                     offset: Offset(0, 0), // changes position of shadow
//                   ),
//                 ],
//                 color: Color(0xffFFFFFF),
//                 border: Border.all(
//                   width: 2.00,
//                   color: Color(0xffFFFFFF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.00),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     children: <Widget>[
//                       Image.asset(
//                         'assets/images/ic_time.png',
//                         width: 25,
//                         height: 30,
//                       ),
//                       SizedBox(
//                         width: getProportionateScreenWidth(8),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "From",
//                             //textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: "Helvetica Neue",
//                               fontWeight: FontWeight.w500,
//                               fontSize: getProportionateScreenWidth(12),
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Text(
//                             "$_selectedStartDate",
//                             //textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: "Helvetica Neue",
//                               fontWeight: FontWeight.w500,
//
//                               color: Colors.black,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () async {
//               FocusScope.of(context).requestFocus(new FocusNode());
//               TimeOfDay picked = await showTimePicker(
//                 helpText: "Select Close Time",
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//                 builder: (BuildContext context, Widget child) {
//                   return Theme(
//                     data: ThemeData.light().copyWith(
//                       primaryColor: AppColors.APP_PRIMARY_COLOR,
//                       accentColor: AppColors.APP_PRIMARY_COLOR,
//                       colorScheme: ColorScheme.light(
//                         primary: AppColors.APP_PRIMARY_COLOR,
//                       ),
//                       buttonTheme:
//                           ButtonThemeData(textTheme: ButtonTextTheme.primary),
//                     ),
//                     child: MediaQuery(
//                         data: MediaQuery.of(context)
//                             .copyWith(alwaysUse24HourFormat: false),
//                         child: child),
//                   );
//                 },
//               );
//               if (picked != null) {
//                 setState(() {
//                   _selectedEndDate = picked.format(context).trim();
//                   MaterialLocalizations localization =
//                       MaterialLocalizations.of(context);
//                   qParams['closeTime'] = localization.formatTimeOfDay(picked,
//                       alwaysUse24HourFormat: true);
//                 });
//               }
//             },
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.43,
//
//               padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     blurRadius: 1,
//                     offset: Offset(0, 0), // changes position of shadow
//                   ),
//                 ],
//                 color: Color(0xffFFFFFF),
//                 border: Border.all(
//                   width: 2.00,
//                   color: Color(0xffFFFFFF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.00),
//               ),
//               margin: EdgeInsets.only(right: 5),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     children: <Widget>[
//                       Image.asset(
//                         'assets/images/ic_time.png',
//                         width: 25,
//                         height: 30,
//                       ),
//                       SizedBox(
//                         width: getProportionateScreenWidth(8),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "To",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: "Helvetica Neue",
//                               fontWeight: FontWeight.w500,
//
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Text(
//                             "$_selectedEndDate",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: "Helvetica Neue",
//                               fontWeight: FontWeight.w500,
//
//                               color: Colors.black,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   String validateDeliveryCharges(String value) {
//     value = value.replaceAll(" ", "");
//     if (value.length > 0)
//       return 'Delivery charges must be more than 0';
//     else
//       return null;
//   }
//
//   String validatePhoneNumber(String value) {
//     value = value.replaceAll(" ", "");
//     if (value.length != 11)
//       return 'Phone Number must be of 11 digit';
//     else
//       return null;
//   }
//
//   void callUpdateShopSettingsApi() {
//     qParams["shop_phone"] =
//         numberController.text.substring(1, numberController.text.length);
//     print("${qParams["shop_phone"]}");
//     if (selfDelivery == 1 && deliveryChargesController.text.isNotEmpty) {
//       _shopSettingsController.sink.add(true);
//       daysList.removeWhere((element) => !element.getSelected);
//       qParams['days'] = daysList.toString();
//       qParams['self_deliver'] = selfDelivery.toString();
//       _viewModel.getVendorSettingsRepository().callUpdateShopDataApi(qParams);
//     } else {
//       _shopSettingsController.sink.add(true);
//       daysList.removeWhere((element) => !element.getSelected);
//       qParams['days'] = daysList.toString();
//       qParams['self_deliver'] = selfDelivery.toString();
//       qParams['shop_phone'] = numberController.text;
//       _viewModel.getVendorSettingsRepository().callUpdateShopDataApi(qParams);
//     }
//   }
//
//   void subscribeToViewModel() {
//     _viewModel
//         .getVendorSettingsRepository()
//         .getRepositoryResponse()
//         .listen((response) {
//       if (response.success) {
//         if (response.data is Shop) {
//           _shop = response.data;
//           // print(_shop.toJson().toString());
//           if (_shop.khataOnly != null && _shop.khataOnly == 1) {
//           } else {
//             shopImage = _shop.shopImage;
//             billImage = _shop.billImage;
//             invoiceImage = _shop.invoiceImage;
//             numberController.text = _shop.shopPhone;
//             descriptionController.text = _shop.description;
//             this.selfDelivery = _shop.selfDeliver;
//             if (_shop.selfDeliver == 1) {
//               this.deliveryChargesController.text =
//                   _shop.deliveryCharges.toString();
//               this.deliveryCharges = _shop.deliveryCharges.toString();
//               _height = getProportionateScreenHeight(40);
//             } else
//               _height = 0.0;
//             setDays();
//             var now = new DateTime.now();
//             if (_shop.openTime.length != null && _shop.openTime.length > 0) {
//               now = DateTime(
//                   now.year,
//                   now.month,
//                   now.day,
//                   int.parse(_shop.openTime.split(":")[0]),
//                   int.parse(_shop.openTime.split(":")[1]),
//                   int.parse(_shop.openTime.split(":")[2]));
//               _selectedStartDate = DateFormat('hh:mm a').format(now).toString();
//             }
//             if (_shop.closeTime.length != null && _shop.closeTime.length > 0) {
//               now = DateTime(
//                   now.year,
//                   now.month,
//                   now.day,
//                   int.parse(_shop.closeTime.split(":")[0]),
//                   int.parse(_shop.closeTime.split(":")[1]),
//                   int.parse(_shop.closeTime.split(":")[2]));
//               _selectedEndDate = DateFormat('hh:mm a').format(now).toString();
//             }
//           }
//
//           isLoading = false;
//           setState(() {});
//         } else {
//           ToastUtil.showToast(context, response.msg);
//           Navigator.pop(context);
//         }
//       } else {
//         if (response.code >= 1 && response.code <= 4) {
//           _isInternetAvailable = false;
//           errorMsg = response.msg;
//           _dataController.sink.add(false);
//         }
//         ToastUtil.showToast(context, response.msg);
//       }
//       _shopSettingsController.sink.add(false);
//     });
//   }
//
//   void setDays() {
//     var list = _shop.days
//         .replaceAll("}, {", ",")
//         .replaceAll("{", "")
//         .replaceAll("}", "")
//         .replaceAll("[", "")
//         .replaceAll("]", "")
//         .split(",");
//     // print(list);
//     var selectedDays = "";
//     daysList.forEach((element) {
//       if (list.indexWhere((value) => value == element.dayName) > -1) {
//         element.setSelected = true;
//         selectedDays = "$selectedDays-${element.dayName}";
//       }
//     });
//     if (selectedDays.length > 0) {
//       shopDaysController.text = selectedDays.substring(1, selectedDays.length);
//     } else {
//       shopDaysController.text = "Select Days";
//     }
//   }
//
//   Future selectGallery(param) async {
//     var permissionStatus =
//         await Util.getPermission(Constants.galleryPermissionValue);
//     if (permissionStatus) {
//       var image = await ImagePicker.pickImage(
//           source: ImageSource.gallery, imageQuality: 40);
//       setState(() {
//         if (image != null) {
//           List<int> imageBytes = image.readAsBytesSync();
//           if (param == 'shop') {
//             shopImage = base64Encode(imageBytes);
//             qParams['shop_image'] = 'data:image/jpeg;base64,' + shopImage;
//           } else if (param == 'bill') {
//             billImage = base64Encode(imageBytes);
//             qParams['bill_image'] = 'data:image/jpeg;base64,' + billImage;
//           } else if (param == 'invoice') {
//             invoiceImage = base64Encode(imageBytes);
//             qParams['invoice_image'] = 'data:image/jpeg;base64,' + invoiceImage;
//           }
//         }
//       });
//     }
//   }
//
//   Future selectCamera(param) async {
//     var permissionStatus =
//         await Util.getPermission(AppStrings.cameraPermissionValue);
//     if (permissionStatus) {
//       var image = await ImagePicker.pickImage(
//           source: ImageSource.camera, imageQuality: 40);
//       setState(() {
//         if (image != null) {
//           List<int> imageBytes = image.readAsBytesSync();
//           if (param == 'shop') {
//             shopImage = base64Encode(imageBytes);
//             qParams['shop_image'] = 'data:image/jpeg;base64,' + shopImage;
//           } else if (param == 'bill') {
//             billImage = base64Encode(imageBytes);
//             qParams['bill_image'] = 'data:image/jpeg;base64,' + billImage;
//           } else if (param == 'invoice') {
//             invoiceImage = base64Encode(imageBytes);
//             qParams['invoice_image'] = 'data:image/jpeg;base64,' + invoiceImage;
//           }
//         }
//       });
//     }
//   }
//
//   void getVendorData() {
//     App().getAppPreferences().getVendorData().then((value) {
//       selectedAddress = value.shop.address ?? null;
//       _dataController.sink.add(true);
//     });
//   }
//
//   Widget getSelfDeliveryWidget() {
//     return Container(
//         color: GREEN_OPS_COLOR.withOpacity(0.09),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 "Shop Self Delivery",
//                 style: TextStyle(
//                   fontFamily: "Helvetica",
//                   fontSize: getProportionateScreenWidth(20),
//                   color: BLACK_OPS_COLOR,
//                 ),
//               ),
//             ),
//             Divider(
//               thickness: 1.0,
//             ),
//             Container(
//               // margin: EdgeInsets.only(left: getProportionateScreenWidth(70),right: getProportionateScreenWidth(70)),
//               child: Row(
//                 children: [
//                   Spacer(),
//                   Radio(
//                       value: 1,
//                       groupValue: selfDelivery,
//                       activeColor: Colors.green,
//                       onChanged: (value) {
//                         setState(() {
//                           selfDelivery = value;
//                           _height = getProportionateScreenHeight(40);
//                           if (deliveryCharges != null)
//                             this.deliveryChargesController.text =
//                                 deliveryCharges;
//                         });
//                         Future.delayed(Duration(milliseconds: 500), () {
//                           myFocusNode.requestFocus();
//                         });
//                       }),
//                   Text(
//                     "Yes ",
//                     style: TextStyle(
//                       fontFamily: "Helvetica",
//                       fontSize: getProportionateScreenWidth(20),
//                       color: selfDelivery == 1 ? Colors.green : BLACK_OPS_COLOR,
//                     ),
//                   ),
//                   Spacer(),
//                   Radio(
//                       value: 0,
//                       groupValue: selfDelivery,
//                       activeColor: Colors.red,
//                       onChanged: (value) {
//                         setState(() {
//                           this.deliveryChargesController.clear();
//                           selfDelivery = value;
//                           _height = 0.0;
//                         });
//                         myFocusNode.unfocus();
//                       }),
//                   Text(
//                     "No",
//                     style: TextStyle(
//                       fontFamily: "Helvetica",
//                       fontSize: getProportionateScreenWidth(20),
//                       color: selfDelivery == 0 ? Colors.red : BLACK_OPS_COLOR,
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//             ),
//             AnimatedContainer(
//               height: _height,
//               duration: Duration(seconds: 1),
//               curve: Curves.fastOutSlowIn,
//               //width: MediaQuery.of(context).size.width / 1.5,
//               margin: EdgeInsets.all(10),
//               child: new Theme(
//                 data: new ThemeData(
//                   primaryColor: const Color(0xffffffff),
//                   primaryColorDark: const Color(0xffffffff),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 1,
//                         offset: Offset(0, 0), // changes position of shadow
//                       ),
//                     ],
//                     color: Color(0xffFFFFFF),
//                     border: Border.all(
//                         width: 2.00,
//                         color:
//                             Colors.green.withOpacity(0.3) //Color(0xffFFFFFF),
//                         ),
//                     borderRadius: BorderRadius.circular(5.00),
//                   ),
//                   // height: getProportionateScreenHeight(30),
//                   child: TextFormField(
//                     focusNode: myFocusNode,
//                     controller: deliveryChargesController,
//                     inputFormatters: [
//                       WhitelistingTextInputFormatter.digitsOnly
//                     ],
//
//                     //validator: validateDeliveryCharges,
//                     onChanged: (val) {
//                       qParams['delivery_charges'] =
//                           deliveryChargesController.text;
//                     },
//                     style: TextStyle(
//                       fontFamily: "Helvetica",
//
//                       color: const Color(0xff444444),
//                     ),
//                     textAlign: TextAlign.start,
//                     keyboardType: TextInputType.number,
//                     autofocus: false,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       errorBorder: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       // hasFloatingPlaceholder: false,
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       // Hint to input box
//                       labelText: "Delivery Charges Per Order",
//                       labelStyle: TextStyle(
//
//                         fontFamily: 'Helvetica',
//                         // color: Color(0xff444444)
//                       ),
//                       contentPadding: EdgeInsets.only(
//                           left: 6.0, bottom: getProportionateScreenHeight(15)),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             //: Center(),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Wrap(
//                 children: [
//                   Text(
//                     "Note:  ",
//                     style: TextStyle(
//                       fontFamily: "Helvetica",
//                       fontSize: getProportionateScreenWidth(16),
//                       color: Colors.green,
//                     ),
//                   ),
//                   Text(
//                     "Delivery timing will be the same as your shop timing.",
//                     style: TextStyle(
//                       fontFamily: "Helvetica",
//                       fontSize: getProportionateScreenWidth(16),
//                       color: BLACK_OPS_COLOR,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
//
//   getRespectedWidget({height, width}) {
//     if (_shop.khataOnly != null && _shop.khataOnly == 1) {
//       return ListView(
//         padding: EdgeInsets.all(15),
//         children: [
//           // Container(
//           //     padding: EdgeInsets.only(left: 5, bottom: 10),
//           //     child: Row(
//           //       children: [
//           //         Text(
//           //           'Shop Phone No',
//           //           style: TextStyle(
//           //               fontSize:
//           //               getProportionateScreenWidth(14),
//           //               color: Color(0xff444444)),
//           //         ),
//           //         Text(
//           //           '*',
//           //           style: TextStyle(color: Colors.red),
//           //         )
//           //       ],
//           //     )),
//           // Container(
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: [
//           //       Row(
//           //         children: [
//           //           Container(
//           //             height: getProportionateScreenHeight(45),
//           //             width:
//           //             MediaQuery.of(context).size.width / 5,
//           //             decoration: BoxDecoration(
//           //               color: Color(0xfff2f2f2),
//           //               borderRadius:
//           //               BorderRadius.circular(5.00),
//           //             ),
//           //             child: Container(
//           //               margin: EdgeInsets.only(right: 5),
//           //               child: Row(
//           //                 mainAxisAlignment:
//           //                 MainAxisAlignment.spaceEvenly,
//           //                 children: [
//           //                   Container(
//           //                     child: Image.asset(
//           //                       'assets/images/ic_flag_pak.png',
//           //                       height:
//           //                       getProportionateScreenHeight(
//           //                           30),
//           //                       width:
//           //                       getProportionateScreenWidth(
//           //                           30),
//           //                     ),
//           //                   ),
//           //                   Text(
//           //                     "+92",
//           //                     style: TextStyle(
//           //                       fontFamily: "Helvetica",
//           //                       fontSize:
//           //                       getProportionateScreenWidth(
//           //                           14),
//           //                       color: Color(0xff444444),
//           //                     ),
//           //                   )
//           //                 ],
//           //               ),
//           //             ),
//           //           )
//           //         ],
//           //       ),
//           //       buildMobileNumberWidget(context)
//           //     ],
//           //   ),
//           // ),
//           SizedBox(
//
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.pushNamed(
//                 context,
//                 AppRoutes.APP_ROUTE_ADD_BUSINESS,
//               );
//             },
//             child: Container(
//                 height: height * 0.2,
//                 padding: EdgeInsets.all(height * 0.02),
//                 decoration: BoxDecoration(
//                     color: GREEN_OPS_COLOR.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Create Your Business Online',
//                           style: TextStyle(
//                               fontSize: height * 0.02, color: GREEN_OPS_COLOR),
//                         ),
//                         SizedBox(
//                           height: height * 0.05,
//                         ),
//                         FloatingActionButton(
//                             backgroundColor: Colors.white,
//                             child: Text('GO',
//                                 style: TextStyle(
//                                     fontSize: height * 0.016,
//                                     color: GREEN_OPS_COLOR)),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 AppRoutes.APP_ROUTE_ADD_BUSINESS,
//                               );
//                             })
//                       ],
//                     ),
//                     Container(
//                         child:
//                             Image.asset('assets/images/ic_createBussiness.png'))
//                   ],
//                 )),
//           )
//         ],
//       );
//     } else {
//       return ListView(
//         padding: EdgeInsets.all(15),
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // getImage(
//                   //     context: context,
//                   //     selectCamera: selectCamera,
//                   //     selectGallery: selectGallery,
//                   //     param: 'shop');
//                 },
//                 child: Container(
//
//                   width: shopImage == null
//                       ? MediaQuery.of(context).size.width - 30
//                       : MediaQuery.of(context).size.width * 0.68,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 1,
//                         offset: Offset(0, 0), // changes position of shadow
//                       ),
//                     ],
//                     color: Color(0xffFFFFFF),
//                     border: Border.all(
//                       width: 2.00,
//                       color: Color(0xffFFFFFF),
//                     ),
//                     borderRadius: BorderRadius.circular(5.00),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                             left: getProportionateScreenWidth(10)),
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: AppColors.APP_PRIMARY_COLOR,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset('assets/images/store_icon.png'),
//                         height: getProportionateScreenHeight(40),
//                         width: getProportionateScreenWidth(40),
//                       ),
//                       SizedBox(
//                         width: getProportionateScreenWidth(10),
//                       ),
//                       Text(
//                         shopImage == null
//                             ? "Upload Shop Image"
//                             : "Shop Image Uploaded",
//                         style: TextStyle(
//                           fontFamily: "Helvetica",
//                           fontSize: getProportionateScreenWidth(13),
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff444444),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               shopImage == null
//                   ? Container()
//                   : Container(
//
//
//                       decoration: new BoxDecoration(
//                         image: new DecorationImage(
//                           image: shopImage.contains('https')
//                               ? NetworkImage(shopImage)
//                               : MemoryImage(base64Decode(shopImage)),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: new BorderRadius.circular(5.0),
//                       ))
//             ],
//           ),
//           SizedBox(
//
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // getImage(
//                   //     context: context,
//                   //     selectCamera: selectCamera,
//                   //     selectGallery: selectGallery,
//                   //     param: 'bill');
//                 },
//                 child: Container(
//
//                   width: billImage == null
//                       ? MediaQuery.of(context).size.width - 30
//                       : MediaQuery.of(context).size.width * 0.68,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 1,
//                         offset: Offset(0, 0), // changes position of shadow
//                       ),
//                     ],
//                     color: Color(0xffFFFFFF),
//                     border: Border.all(
//                       width: 2.00,
//                       color: Color(0xffFFFFFF),
//                     ),
//                     borderRadius: BorderRadius.circular(5.00),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                             left: getProportionateScreenWidth(10)),
//                         padding: EdgeInsets.all(6),
//                         decoration: BoxDecoration(
//                           color: AppColors.APP_PRIMARY_COLOR,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset('assets/images/bill_icon.png'),
//                         height: getProportionateScreenHeight(40),
//                         width: getProportionateScreenWidth(40),
//                       ),
//                       SizedBox(
//                         width: getProportionateScreenWidth(10),
//                       ),
//                       Text(
//                         billImage == null
//                             ? "Upload Bill Image"
//                             : "Bill Image Uploaded",
//                         style: TextStyle(
//                           fontFamily: "Helvetica",
//                           fontSize: getProportionateScreenWidth(13),
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff444444),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               billImage == null
//                   ? Container()
//                   : Container(
//
//
//                       decoration: new BoxDecoration(
//                         image: new DecorationImage(
//                           image: billImage.contains('https')
//                               ? NetworkImage(billImage)
//                               : MemoryImage(base64Decode(billImage)),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: new BorderRadius.circular(5.0),
//                       ))
//             ],
//           ),
//           SizedBox(
//
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // getImage(
//                   //     context: context,
//                   //     selectCamera: selectCamera,
//                   //     selectGallery: selectGallery,
//                   //     param: 'invoice');
//                 },
//                 child: Container(
//
//                   width: invoiceImage == null
//                       ? MediaQuery.of(context).size.width - 30
//                       : MediaQuery.of(context).size.width * 0.68,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 1,
//                         offset: Offset(0, 0), // changes position of shadow
//                       ),
//                     ],
//                     color: Color(0xffFFFFFF),
//                     border: Border.all(
//                       width: 2.00,
//                       color: Color(0xffFFFFFF),
//                     ),
//                     borderRadius: BorderRadius.circular(5.00),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                             left: getProportionateScreenWidth(10)),
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: AppColors.APP_PRIMARY_COLOR,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset(
//                           'assets/images/invoice_icon.png',
//                         ),
//                         height: getProportionateScreenHeight(40),
//                         width: getProportionateScreenWidth(40),
//                       ),
//                       SizedBox(
//                         width: getProportionateScreenWidth(10),
//                       ),
//                       Text(
//                         invoiceImage == null
//                             ? "Upload Invoice Image"
//                             : "Invoice Image Uploaded",
//                         style: TextStyle(
//                           fontFamily: "Helvetica",
//                           fontSize: getProportionateScreenWidth(13),
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff444444),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               invoiceImage == null
//                   ? Container()
//                   : Container(
//
//
//                       decoration: new BoxDecoration(
//                         image: new DecorationImage(
//                           image: invoiceImage.contains('https')
//                               ? NetworkImage(invoiceImage)
//                               : MemoryImage(base64Decode(invoiceImage)),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: new BorderRadius.circular(5.0),
//                       ))
//             ],
//           ),
//           SizedBox(
//
//           ),
//           Container(
//               padding: EdgeInsets.only(left: 5, bottom: 10),
//               child: Row(
//                 children: [
//                   Text(
//                     'Shop Phone No',
//                     style: TextStyle(
//
//                         color: Color(0xff444444)),
//                   ),
//                   Text(
//                     '*',
//                     style: TextStyle(color: Colors.red),
//                   )
//                 ],
//               )),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: getProportionateScreenHeight(45),
//                       width: MediaQuery.of(context).size.width / 5,
//                       decoration: BoxDecoration(
//                         color: Color(0xfff2f2f2),
//                         borderRadius: BorderRadius.circular(5.00),
//                       ),
//                       child: Container(
//                         margin: EdgeInsets.only(right: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               child: Image.asset(
//                                 'assets/images/ic_flag_pak.png',
//                                 height: getProportionateScreenHeight(30),
//                                 width: getProportionateScreenWidth(30),
//                               ),
//                             ),
//                             Text(
//                               "+92",
//                               style: TextStyle(
//                                 fontFamily: "Helvetica",
//
//                                 color: Color(0xff444444),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 buildMobileNumberWidget(context)
//               ],
//             ),
//           ),
//           SizedBox(
//
//           ),
//           buildDescriptionWidget(context),
//           SizedBox(
//             height: getProportionateScreenHeight(20),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(15.0),
//                 topLeft: Radius.circular(15.0),
//               ),
//             ),
//             child: Column(
//               children: [
//                 buildDaysWidget(context),
//                 Container(
//                     margin:
//                         EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
//                     width: MediaQuery.of(context).size.width,
//                     height: 40,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: daysList.length,
//                       itemBuilder: (context, index) =>
//                           buildDaysNameItems(context, index),
//                     )),
//               ],
//             ),
//           ),
//           SizedBox(
//
//           ),
//           buildShopTimingWidget(context),
//           SizedBox(
//             height: getProportionateScreenHeight(20),
//           ),
//           getSelfDeliveryWidget(),
//           SizedBox(
//             height: getProportionateScreenHeight(40),
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(
//                             context, AppRoutes.APP_ROUTE_SELECT_VENDOR_LOCATION,
//                             arguments: "Yes")
//                         .then((value) {
//                       if (value != null) {
//                         Map map = value;
//                         selectedLatitude = map['lat'];
//                         selectedLongitude = map['long'];
//                         selectedAddress = map['address'];
//                         qParams['latitude'] = selectedLatitude;
//                         qParams['longitude'] = selectedLongitude;
//                         _dataController.sink.add(true);
//                       }
//                     });
//                   },
//                   child: Container(
//                     height: getProportionateScreenHeight(85),
//                     width: MediaQuery.of(context).size.width / 1.1,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           blurRadius: 1,
//                           offset: Offset(0, 0), // changes position of shadow
//                         ),
//                       ],
//                       color: Color(0xffFFFFFF),
//                       border: Border.all(
//                         width: 2.00,
//                         color: Color(0xffFFFFFF),
//                       ),
//                       borderRadius: BorderRadius.circular(5.00),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: getProportionateScreenWidth(10)),
//                           padding: EdgeInsets.all(5),
//                           child: Icon(
//                             Icons.location_on_outlined,
//                             color: AppColors.APP_PRIMARY_COLOR,
//                             size: 40,
//                           ),
//
//                           width: getProportionateScreenWidth(50),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: getProportionateScreenWidth(10)),
//                           child: Center(
//                             child: Text(
//                               selectedAddress ?? "Select Latitude & Longitude",
//                               maxLines: 1,
//                               style: TextStyle(
//                                 fontFamily: "Helvetica",
//                                 fontSize: getProportionateScreenWidth(13),
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff444444),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(40),
//           ),
//           StreamBuilder<bool>(
//               stream: _shopSettingsController.stream,
//               builder: (context, snapshot) {
//                 if (snapshot.data != null && snapshot.data) {
//                   return Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Loader(isLoading: true, color: Colors.green));
//                 } else {
//                   return InkWell(
//                     onTap: () {
//                       callUpdateShopSettingsApi();
//                     },
//                     child: Container(
//                       height: getProportionateScreenHeight(45),
//                       decoration: DecorationBox.decorationButtonWithGradient(),
//                       margin: EdgeInsets.only(
//                           left: MediaQuery.of(context).size.width * 0.2,
//                           right: MediaQuery.of(context).size.width * 0.2),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Save",
//                               style: TextStyle(
//                                 fontFamily: "Helvetica",
//                                 fontWeight: FontWeight.w600,
//
//                                 color: Color(0xffffffff),
//                               )),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//         ],
//       );
//     }
//   }
// }
