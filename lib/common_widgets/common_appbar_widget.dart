import 'package:dakini1/gen/assets.gen.dart';
import 'package:dakini1/gen/colors.gen.dart';
import 'package:dakini1/helpers/navigation_service.dart';
import 'package:dakini1/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          UIHelper.verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Back Icon
              SizedBox(
                width: 120.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 24.sp,
                          color: AppColors.c727175,
                        ),
                      ),
                      onTap: () => NavigationService.goBack,
                    ),
                  ],
                ),
              ),
              // App Logo
              Image.asset(
                Assets.icons.appInnerLogo.path,
                height: 84.h,
                fit: BoxFit.contain,
              ),
              // Action Icons
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SizedBox(
                  width: 120.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(Assets.icons.errorIcon,
                            height: 24.h, fit: BoxFit.contain),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        child: SvgPicture.asset(Assets.icons.notificationIcon,
                            height: 24.h, fit: BoxFit.contain),
                        onTap: () {},
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        child: SvgPicture.asset(
                          Assets.icons.profileIcon,
                          // color: AppColors.c727175,
                          height: 24.h,
                          fit: BoxFit.contain,
                          // size: 24.sp,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }
}
