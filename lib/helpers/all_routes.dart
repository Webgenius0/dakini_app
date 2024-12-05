import 'dart:io';

import 'package:dakini1/feature/auth/presentation/login/login_otp_verify.dart';
import 'package:dakini1/feature/auth/presentation/login/login_screen.dart';
import 'package:dakini1/feature/auth/presentation/signup/signup_more_info_screen.dart';
import 'package:dakini1/feature/auth/presentation/signup/signup_screen.dart';
import 'package:dakini1/feature/home/presentation/home_screen.dart';
import 'package:flutter/cupertino.dart';

import '../navigation_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String logIn = '/logIn';
  static const String signUp = '/signUp';
  static const String signupMoreInfo = '/signupMoreInfo';
  static const String loginOtpVerify = '/loginOtpVerify';

  static const String home = '/home';

  static const String changePassword = '/ChangePassword';
  static const String navigationScreen = '/NavigationScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUp:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SignupScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SignupScreen());
      case Routes.logIn:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const LoginScreen());
      case Routes.signupMoreInfo:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SignupMoreInfoScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const SignupMoreInfoScreen());
      case Routes.loginOtpVerify:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginOtpVerify()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const LoginOtpVerify());
      case Routes.home:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: HomeScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const HomeScreen());

      // case Routes.payMentScreen:
      //   final args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: PayMentScreen(
      //             addressHeader: args["header"],
      //             address: args["detail"],
      //             totalPrice: args["totalPrice"],
      //             contraNo: args["contractNo"],
      //           ),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => PayMentScreen(
      //                 addressHeader: args["header"],
      //                 address: args["detail"],
      //                 totalPrice: args["totalPrice"],
      //                 contraNo: args["contractNo"],
      //               ));

      // case Routes.webview:
      //   final args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: WebviewHelper(
      //             name: args["name"],
      //             url: args["url"],
      //           ),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => WebviewHelper(
      //                 name: args["name"],
      //                 url: args["url"],
      //               ));
      case Routes.navigationScreen:
        // final args = settings.arguments as Map;
        // Widget widget = args["val"] as Widget;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const NavigationScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NavigationScreen());

      // case Routes.sliderWebViewPage:
      //   final args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget:
      //               SliderWebViewPage(title: args["title"], url: args["url"]),
      //           settings:
      //               settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
      //       : CupertinoPageRoute(
      //           builder: (context) =>
      //               SliderWebViewPage(title: args["title"], url: args["url"]));

      default:
        return null;
    }
  }
}

//  weenAnimationBuilder(
//   child: Widget,
//   tween: Tween<double>(begin: 0, end: 1),
//   duration: Duration(milliseconds: 1000),
//   curve: Curves.bounceIn,
//   builder: (BuildContext context, double _val, Widget child) {
//     return Opacity(
//       opacity: _val,
//       child: Padding(
//         padding: EdgeInsets.only(top: _val * 50),
//         child: child
//       ),
//     );
//   },
// );

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
