// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/helpers/di.dart';
import '/helpers/toast.dart';
import '../common_widgets/custom_button.dart';
import '../constants/app_constants.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../provider/provides.dart';

//final appData = locator.get<GetStorage>();
final plcaeMarkAddress = locator.get<PlcaeMarkAddress>();
//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

enum StatusType { order, delivery }

Color statuscolor(StatusType status, String statusCode) {
  late Color stcolor;
  if (StatusType.order == status) {
    switch (statusCode) {
      case OrderStatusNo.kPENDING:
        stcolor = OrderStatusColor.kPENDING;
        break;
      case OrderStatusNo.kACCEPTED:
        stcolor = OrderStatusColor.kACCEPTED;
        break;
      case OrderStatusNo.kFOODPROCESSING:
        stcolor = OrderStatusColor.kFOODPROCESSING;
        break;
      case OrderStatusNo.kFOODREADY:
        stcolor = OrderStatusColor.kFOODREADY;
        break;
      case OrderStatusNo.kFOODPICKED:
        stcolor = OrderStatusColor.kFOODPICKED;
        break;
      case OrderStatusNo.kFOODDELIVERED:
        stcolor = OrderStatusColor.kFOODDELIVERED;
        break;
      case OrderStatusNo.kCANCELLED:
        stcolor = OrderStatusColor.kCANCELLED;
        break;
      case OrderStatusNo.kREJECTEDBYSHOP:
        stcolor = OrderStatusColor.kREJECTEDBYSHOP;
        break;
      case OrderStatusNo.kFAILED:
        stcolor = OrderStatusColor.kFAILED;
        break;
    }
  }
  if (StatusType.delivery == status) {
    switch (statusCode) {
      case DeliveryStatusNo.kPENDIG:
        stcolor = DeliveryStatusColor.kPENDING;
        break;
      case DeliveryStatusNo.kONTRANSIT:
        stcolor = DeliveryStatusColor.kONTRANSIT;
        break;
      case DeliveryStatusNo.kARRIVEDATSHOP:
        stcolor = DeliveryStatusColor.kARRIVEDATSHOP;
        break;
      case DeliveryStatusNo.kDELIVERYMANCONFIRMED:
        stcolor = DeliveryStatusColor.kDELIVERYMANCONFIRMED;
        break;
      case DeliveryStatusNo.kDELIVERYSTARTED:
        stcolor = DeliveryStatusColor.kDELIVERYSTARTED;
        break;
      case DeliveryStatusNo.kDELIVERED:
        stcolor = DeliveryStatusColor.kDELIVERED;
        break;
    }
  }

  return stcolor;
}

String language(String languageKey) {
  late String language;

  switch (languageKey) {
    case kKeyEnglish:
      language = "English";
      break;
    case kKeyFrench:
      language = "French";
      break;
    case kKeyGerman:
      language = "Dutch";
      break;
    case kKeyRussian:
      language = "Russian";
      break;
    case kKeyPortuguese:
      language = "Portuguese";
      break;
    case kKeySpanish:
      language = "Spanish";
      break;
    default:
      language = "Portuguese";
  }
  return language;
}

Future<String?> networkImageToBase64(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));
  final bytes = response.bodyBytes;

  // ignore: unnecessary_null_comparison
  return (bytes != null ? base64Encode(bytes) : null);
}

Future<void> setInitValue() async {
  await appData.writeIfNull(kKeyIsLoggedIn, false);
  await appData.writeIfNull(kKeyIsExploring, false);
  appData.writeIfNull(kKeyLanguage, kKeyPortuguese);
  appData.writeIfNull(kKeyCountryCode, countriesCode[kKeyPortuguese]);
  appData.writeIfNull(kKeySelectedLocation, false);
//lisbon
  // appData.writeIfNull(kKeySelectedLat, 38.74631383626653);
  // appData.writeIfNull(kKeySelectedLng, -9.130169921874991);
//codemen
  await appData.writeIfNull(kKeySelectedLat, 22.818285677915657);
  await appData.writeIfNull(kKeySelectedLng, 89.5535583794117);

  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    appData.writeIfNull(
        kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo =
        await deviceInfo.androidInfo; // unique ID on Android
    appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  }
  await Future.delayed(const Duration(seconds: 2));
}

setLocationLatLong(LatLng latLng, {bool? selectedLocation = false}) async {
  await appData.write(kKeySelectedLat, latLng.latitude);
  await appData.write(kKeySelectedLng, latLng.longitude);
  await appData.write(kKeySelectedLocation, selectedLocation);
}

Future<void> getCartDataApiCall() async {
  // getCartRestaurantRXObj.fetchCartRestaurantData().then(
  //   (restaurant) {
  //     if (restaurant.isNotEmpty) {
  //       getDistanceRXObj.fetchDistanceData(
  //           restaurant["latitude"], restaurant["longitude"]);
  //     }
  //   },
  // );
}

// Future<void> getAddressFromPosition(LatLng latLng, BuildContext context) async {
//   List<Placemark> addresses =
//       await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

//   var address = addresses.first;

//   Provider.of<PlcaeMarkAddress>(context, listen: false).changePlcaeMarkAddress(
//     addres: address.street.toString(),
//     cty: address.locality.toString(),
//     st: address.administrativeArea.toString(),
//     coun: address.country.toString(),
//     post: address.postalCode.toString(),
//     lati: latLng.latitude.toString(),
//     longi: latLng.longitude.toString(),
//   );
// }

Future<void> initiInternetChecker() async {
  InternetConnectionChecker.createInstance(
          checkTimeout: const Duration(seconds: 1),
          checkInterval: const Duration(seconds: 2))
      .onStatusChange
      .listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        ToastUtil.showShortToast('Data connection is available.'.tr);
        break;
      case InternetConnectionStatus.disconnected:
        ToastUtil.showNoInternetToast();
        break;
    }
  });
}

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

Future<void> getInvisible() async {
  Future.delayed(const Duration(milliseconds: 500), () {});
}

// GoogleSignIn googleSignIn = GoogleSignIn(
//   scopes: [],
// );

// void loginWithSocialMedia(String driver) async {
//   String userId, name, email;

//   try {
//     if (driver == kGoogle) {
//       //    googleSignIn.signOut();
//       final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

//       if (googleAccount != null) {
//         userId = googleAccount.id;
//         name = googleAccount.displayName!;
//         email = googleAccount.email;
//         await postSocailLoginRXObj.postSocailLogin(
//             socialAuthId: userId, email: email, firstName: name, lastName: name, registerType: "2");
//       }
//     } else if (driver == kFacebook) {
//       // FacebookLoginResult loginResult = await facebookLogin.logIn(['email']);
//       // switch (loginResult.status) {
//       //   case FacebookLoginStatus.cancelledByUser:
//       //     return;

//       //   case FacebookLoginStatus.error:
//       //     throw Exception(loginResult.errorMessage);
//       //     break;

//       //   case FacebookLoginStatus.loggedIn:
//       //     final token = loginResult.accessToken.token;
//       //     final graphResponse = await http.get(
//       //       Uri.parse(
//       //           'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token'),
//       //     );
//       //     final profile = json.decode(graphResponse.body);

//       //     if (profile != null) {
//       //       userId = profile['id'];
//       //       name = profile['name'];
//       //       email = profile['email'];
//       //     }
//       //     break;

//       //   default:
//       //     break;
//       // }
//     } else if (driver == kApple) {
//       final credential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );
//       print(credential);

//       if (credential.userIdentifier != null) {
//         await postSocailLoginRXObj.postSocailLogin(
//             socialAuthId: credential.userIdentifier!,
//             email: credential.email,
//             firstName: credential.givenName,
//             lastName: credential.familyName,
//             registerType: "4");
//       }
//     }
//   } catch (e) {
//     ToastUtil.showLongToast(e.toString());
//   }
// }

Future<File> getLocalFile(String filename) async {
  File f = File(filename);
  return f;
}

void showMaterialDialog(
  BuildContext context,
) {
  showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Do you want to exit the app?",
              textAlign: TextAlign.center,
              style: TextFontStyle.headline20w400c727175StyleNunito
                  .copyWith(fontSize: 14.sp),
            ),
            actions: <Widget>[
              customeButton(
                  name: "No".tr,
                  onCallBack: () {
                    Navigator.of(context).pop(false);
                  },
                  height: 30.sp,
                  minWidth: .3.sw,
                  borderRadius: 30.r,
                  color: AppColors.cF0F0F0,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 17.sp,
                      color: AppColors.allPrimaryColor,
                      fontWeight: FontWeight.w700),
                  context: context),
              customeButton(
                  name: "Yes".tr,
                  onCallBack: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  height: 30.sp,
                  minWidth: .3.sw,
                  borderRadius: 30.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  context: context),
            ],
          ));
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
