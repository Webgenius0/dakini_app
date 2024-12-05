import 'package:dakini1/common_widgets/common_appbar_widget.dart';
import 'package:dakini1/common_widgets/custom_auth_button.dart';
import 'package:dakini1/common_widgets/custom_dropdown_button.dart';
import 'package:dakini1/constants/text_font_style.dart';
import 'package:dakini1/feature/home/presentation/widgets/lunner_event_widget.dart';
import 'package:dakini1/gen/assets.gen.dart';
import 'package:dakini1/gen/colors.gen.dart';
import 'package:dakini1/helpers/all_routes.dart';
import 'package:dakini1/helpers/navigation_service.dart';
import 'package:dakini1/helpers/ui_helpers.dart';
import 'package:dakini1/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        children: [
          const AppbarWidget(),
          // Remaining body content
          UIHelper.verticalSpace(15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 56.w,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14.sp),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text('Calendario',
                                  style: TextFontStyle
                                      .headline20w400c727175StyleNunito
                                      .copyWith(fontSize: 14.sp)),
                              UIHelper.horizontalSpace(10.w),
                              Text('01-07-2024',
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .headline18w400cC1C1C1StyleArial),
                              UIHelper.horizontalSpace(5.w),
                              const Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                        ),
                        UIHelper.horizontalSpaceSmall,
                        Expanded(
                          child: Consumer<AuthProvider>(
                              builder: (context, provider, child) {
                            return Container(
                                padding: EdgeInsets.all(2.sp),
                                decoration: ShapeDecoration(
                                  color: AppColors.allPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: CustomDropdownButton(
                                  popupMenuColor: AppColors.c1C1C1C,
                                  borderWidth: 0,
                                  items: provider.locationList,
                                  hintText: "Lang",
                                  iconColor: AppColors.cF0F0F0,
                                  contentPadding: const EdgeInsets.all(0),
                                  textStyle: TextFontStyle
                                      .headline20w400c727175StyleNunito
                                      .copyWith(
                                          fontSize: 16.sp,
                                          color: AppColors.cFFFFFF),
                                  iconSize: 18.sp,
                                  onChanged: (value) =>
                                      provider.onLocationChange(value),
                                  borderRadius: 12.r,
                                  borderColor: AppColors.allPrimaryColor,
                                ));
                          }),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  const LunnerEventWidget(),
                  UIHelper.verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.allPrimaryColor)),
                        width: 40.w,
                        height: 40.h,
                        padding: EdgeInsets.all(10.sp),
                        child: Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF8F8F8F),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF8F8F8F),
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text('Ver 10a Lunacion',
                            textAlign: TextAlign.center,
                            style: TextFontStyle
                                .headline16w500c799021StyleNunitoNormal),
                      ),
                      Column(
                        children: [
                          Text(
                            'Otono',
                            textAlign: TextAlign.center,
                            style:
                                TextFontStyle.headline16w500c799021StyleNunito,
                          ),
                          Text(
                            'Semana 41',
                            textAlign: TextAlign.center,
                            style: TextFontStyle
                                .headline16w500c799021StyleNunitoNormal
                                .copyWith(fontSize: 12.sp),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF8F8F8F),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('< Hoy',
                                textAlign: TextAlign.center,
                                style: TextFontStyle
                                    .headline16w500c799021StyleNunitoNormal),
                          )
                        ],
                      )
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,
                  Image.asset(
                    Assets.images.moonImage.path,
                    height: 222.h,
                    width: 227.w,
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    'LFC 17:00 - 24:00',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.headline16w500c799021StyleNunitoNormal
                        .copyWith(fontSize: 20.sp, color: AppColors.c1C1C1C),
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                        child: CustomAuthButton(
                          onTap: () => NavigationService.navigateTo(
                              Routes.signupMoreInfo),
                          // fillColor: AppColors.scaffoldColor,
                          child: Center(
                            child: Text(
                              "Mi Diario",
                              style: TextFontStyle
                                  .headline20w400c727175StyleNunito
                                  .copyWith(
                                      color: AppColors.cFFFFFF,
                                      fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                      UIHelper.horizontalSpace(20.h),
                      Expanded(
                        child: CustomAuthButton(
                          fillColor: AppColors.scaffoldColor,
                          child: Center(
                            child: Text(
                              "Mi Planificador",
                              style: TextFontStyle
                                  .headline20w400c727175StyleNunito
                                  .copyWith(
                                      color: AppColors.allPrimaryColor,
                                      fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
