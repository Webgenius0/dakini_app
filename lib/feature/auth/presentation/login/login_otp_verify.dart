import 'package:dakini1/common_widgets/auth_button.dart';
import 'package:dakini1/common_widgets/custom_dropdown.dart';
import 'package:dakini1/common_widgets/custom_otp_widget.dart';
import 'package:dakini1/constants/text_font_style.dart';
import 'package:dakini1/gen/assets.gen.dart';
import 'package:dakini1/gen/colors.gen.dart';
import 'package:dakini1/helpers/all_routes.dart';
import 'package:dakini1/helpers/navigation_service.dart';
import 'package:dakini1/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOtpVerify extends StatefulWidget {
  const LoginOtpVerify({super.key});

  @override
  State<LoginOtpVerify> createState() => _LoginOtpVerifyState();
}

class _LoginOtpVerifyState extends State<LoginOtpVerify> {
  final _formKey = GlobalKey<FormState>();
  final _OTPCnt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 0.h),
        child: Column(
          children: [
            UIHelper.verticalSpace(59.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.horizontalSpace(63.w),
                Image.asset(
                  Assets.icons.appInnerLogo.path,
                  width: 129.w,
                  height: 191.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: MyCustomDropdown(
                    height: 40.h,
                    width: 63.w,
                    selectedValue: 'Eng',
                    hinttext: "Eng",
                    horizonPadding: 0,
                    dropDownValue: const ["Eng", "Bn"],
                    isImageNull: true,
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpaceMediumLarge,
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Enter your OTP',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline24w600cC1C1C1StyleNunito),
                  UIHelper.verticalSpace(18.h),
                  Text(
                    'A 6 Digit code has been sent to your email address , please confirm the code to verify your account',
                    style:
                        TextFontStyle.headline20w400c727175StyleNunito.copyWith(
                      fontSize: 18.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(18.h),
                  OtpVerificationWidget(
                    controller: _OTPCnt,
                    length: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'OTP is required';
                      }
                      return null;
                      // return;
                    },
                  ),
                  UIHelper.verticalSpace(18.h),
                  
                  AuthCustomeButton(
                      name: "Log in",
                      onCallBack: () {
                        NavigationService.navigateTo(Routes.home);
                        // appData.write(kKeyIsLoggedIn, true);
                        // if (_formKey.currentState!.validate()) {
                        //   log("Validate");
                        // }
                      },
                      height: 56.h,
                      minWidth: 340.w,
                      borderRadius: 12.r,
                      color: AppColors.c799021,
                      textStyle: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(color: AppColors.cFFFFFF),
                      context: context),
                  UIHelper.verticalSpace(15.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
