import 'package:dakini1/common_widgets/auth_button.dart';
import 'package:dakini1/common_widgets/custom_dropdown.dart';
import 'package:dakini1/common_widgets/custom_text_feild.dart';
import 'package:dakini1/constants/text_font_style.dart';
import 'package:dakini1/gen/assets.gen.dart';
import 'package:dakini1/gen/colors.gen.dart';
import 'package:dakini1/helpers/all_routes.dart';
import 'package:dakini1/helpers/navigation_service.dart';
import 'package:dakini1/helpers/ui_helpers.dart';
import 'package:dakini1/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCnt = TextEditingController();
  final _passwordCnt = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log in',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline24w600cC1C1C1StyleNunito),
                  UIHelper.verticalSpace(20.h),
                  Text('Write your Email address',
                      style: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(
                        fontSize: 18.sp,
                      )),
                  UIHelper.verticalSpace(8.h),
                  CustomFormField(
                    controller: _emailCnt,
                    // borderRadius: 12.r,
                    hintText: "Email address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      String pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text('Password',
                      style: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(
                        fontSize: 18.sp,
                      )),
                  UIHelper.verticalSpace(8.h),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) => CustomFormField(
                      isPass: true,
                      controller: _passwordCnt,
                      isObsecure: provider.isObsecure,
                      suffixIcon: GestureDetector(
                        onTap: () => provider.toggleObsecure(),
                        child: Icon(
                          provider.isObsecure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.c727175,
                        ),
                      ),
                      hintText: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                        // return;
                      },
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),
                  AuthCustomeButton(
                      name: "Log in",
                      onCallBack: () {
                        NavigationService.navigateTo(Routes.loginOtpVerify);
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
                  GestureDetector(
                    onTap: () => NavigationService.navigateTo(Routes.signUp),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'If you do not have an account ? ',
                              style: TextFontStyle
                                  .headline20w400c727175StyleNunito
                                  .copyWith(
                                fontSize: 16.sp,
                              )),
                          TextSpan(
                              text: 'Register',
                              style: TextFontStyle
                                  .headline24w600cC1C1C1StyleNunito
                                  .copyWith(
                                      fontSize: 16.sp,
                                      color: AppColors.c799021)),
                        ],
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100.w,
                          height: 21.h,
                          child: Image.asset(Assets.images.dividerImage.path)),
                    ],
                  ),
                  UIHelper.verticalSpace(15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcons(
                        iconPath: Assets.icons.appleIcon,
                        onTap: () {},
                      ),
                      UIHelper.horizontalSpaceSmall,
                      SocialIcons(
                        iconPath: Assets.icons.facebookIcon,
                        onTap: () {},
                      ),
                      UIHelper.horizontalSpaceSmall,
                      SocialIcons(
                        iconPath: Assets.icons.googleIcon,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//============================== Social Icon Widget ========================================================

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
    required this.iconPath,
    required this.onTap,
  });
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65.w,
        height: 65.h,
        padding: EdgeInsets.all(14.sp),
        decoration: const BoxDecoration(
            color: Color(0xFFDCDDE1), shape: BoxShape.circle),
        child: SvgPicture.asset(
          iconPath,
          height: 24.h,
          width: 24.w,
        ),
      ),
    );
  }
}
