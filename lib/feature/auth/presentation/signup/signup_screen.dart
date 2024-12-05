import 'package:dakini1/common_widgets/custom_auth_button.dart';
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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCnt = TextEditingController();
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
                  Text('Register',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline24w600cC1C1C1StyleNunito),
                  UIHelper.verticalSpace(20.h),
                  Text('Name',
                      style: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(
                        fontSize: 18.sp,
                      )),
                  UIHelper.verticalSpace(8.h),
                  CustomFormField(
                    controller: _nameCnt,
                    hintText: "Write your name...",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text('Write your Email address',
                      style: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(
                        fontSize: 18.sp,
                      )),
                  UIHelper.verticalSpace(8.h),
                  CustomFormField(
                    controller: _emailCnt,
                    hintText: "Write your email address...",
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
                      controller: _passwordCnt,
                      isPass: true,
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
                  CustomFormField(
                    isRead: true,
                    controller: _passwordCnt,
                    // isPass: true,

                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: SvgPicture.asset(
                          Assets.icons.calenderIcon,
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                    ),
                    prefixIcon: Image.asset(
                      Assets.icons.authIconImg.path,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  CustomAuthButton(
                    fillColor: AppColors.scaffoldColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Continue With free trial",
                          style: TextFontStyle.headline20w400c727175StyleNunito
                              .copyWith(
                                  color: AppColors.allPrimaryColor,
                                  fontSize: 16.sp),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.allPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  CustomAuthButton(
                    onTap: () =>
                        NavigationService.navigateTo(Routes.signupMoreInfo ),
                    // fillColor: AppColors.scaffoldColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Continue With Membership",
                          style: TextFontStyle.headline20w400c727175StyleNunito
                              .copyWith(
                                  color: AppColors.cFFFFFF, fontSize: 16.sp),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.cFFFFFF,
                        )
                      ],
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  GestureDetector(
                    onTap: () => NavigationService.navigateTo(Routes.logIn),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'If you have an account ? ',
                              style: TextFontStyle
                                  .headline20w400c727175StyleNunito
                                  .copyWith(
                                fontSize: 16.sp,
                              )),
                          TextSpan(
                              text: 'Log in',
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
               
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
