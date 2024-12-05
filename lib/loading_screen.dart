import 'dart:developer';

import 'package:dakini1/feature/auth/presentation/login/login_screen.dart';
import 'package:dakini1/feature/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    // AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();
    // await getAllShopCategoryRXObj.fetchAllShopCategoryData();
    // await getAllShopRXObj.fetchAllShopData();
    // await getSliderRXObj.fetchSliderData();
    // await getAllSubCategoryRXObj.fetchGetAllSubCategoryData();

    // if (appData.read(kKeyIsLoggedIn)) {
    //   String token = appData.read(kKeyAccessToken);
    //   DioSingleton.instance.update(token);
    //   // await getAllAddressRXObj.fetchAllDeliveryAddressData();
    //   // getProfileRXObj.fetchProfileData();
    //   // getCartRXObj.fetchCartData("0.0");
    //   // LocalNotificationService.getToken();
    // }
    log("Current Lodding State : $_isLoading");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Current Lodding State : $_isLoading");

    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return appData.read(kKeyIsLoggedIn)
          ? const HomeScreen()
          : const LoginScreen();
    }
  }
}
