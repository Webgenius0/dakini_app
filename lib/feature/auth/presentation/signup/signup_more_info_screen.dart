import 'package:dakini1/common_widgets/custom_auth_button.dart';
import 'package:dakini1/common_widgets/custom_dropdown.dart';
import 'package:dakini1/common_widgets/custom_dropdown_button.dart';
import 'package:dakini1/constants/text_font_style.dart';
import 'package:dakini1/gen/assets.gen.dart';
import 'package:dakini1/gen/colors.gen.dart';
import 'package:dakini1/helpers/all_routes.dart';
import 'package:dakini1/helpers/navigation_service.dart';
import 'package:dakini1/helpers/ui_helpers.dart';
import 'package:dakini1/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupMoreInfoScreen extends StatefulWidget {
  const SignupMoreInfoScreen({super.key});

  @override
  State<SignupMoreInfoScreen> createState() => _SignupMoreInfoScreenState();
}

class _SignupMoreInfoScreenState extends State<SignupMoreInfoScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  Text('Location',
                      style: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(
                        fontSize: 18.sp,
                      )),
                  UIHelper.verticalSpace(8.h),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) => CustomDropdownButton(
                      items: provider.locationList,
                      hintText: "Your Country...",
                      iconSize: 24.sp,
                      onChanged: (value) => provider.onLocationChange(value),
                      borderRadius: 12.r,
                      borderColor: AppColors.c727175,
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text('Subscription Plan',
                      style: TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(
                        fontSize: 18.sp,
                      )),
                  UIHelper.verticalSpace(8.h),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) => CustomDropdownButton(
                      items: provider.locationList,
                      hintText: "Select Your Subscription Plan",
                      iconSize: 24.sp,
                      onChanged: (value) => provider.onLocationChange(value),
                      borderRadius: 12.r,
                      borderColor: AppColors.c727175,
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  CustomAuthButton(
                    onTap: () => NavigationService.navigateTo(Routes.logIn),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register",
                          style: TextFontStyle.headline20w400c727175StyleNunito
                              .copyWith(
                                  color: AppColors.cFFFFFF, fontSize: 16.sp),
                        ),
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
