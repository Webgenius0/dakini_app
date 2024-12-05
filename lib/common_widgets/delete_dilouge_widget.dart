import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '/helpers/navigation_service.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';
import 'custom_button.dart';

deleteButtonDialouge(BuildContext context, String text, VoidCallback callback) {
  showDialog(
    builder: (context) => Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: .27.sh, maxWidth: .38.sw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SvgPicture.asset(Assets.icons.apple),
              Text(
                'Are you sure?'.tr,
                style: TextFontStyle.headline16w600c799021StyleNunito
                    .copyWith(color: Colors.black),
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                text.tr,
                style: TextFontStyle.headline16w500c799021StyleNunito.copyWith(
                    color: AppColors.allPrimaryColor, fontSize: 12.sp),
              ),
              UIHelper.verticalSpaceMedium,

              //Gravar Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customeButton(
                      name: 'No'.tr,
                      onCallBack: () {
                        NavigationService.goBack;
                      },
                      height: 30.h,
                      minWidth: .25.sw,
                      borderRadius: 8.r,
                      color: AppColors.cFFFFFF,
                      textStyle: TextFontStyle.headline16w500c799021StyleNunito
                          .copyWith(color: AppColors.c000000, fontSize: 12.sp),
                      context: context),
                  UIHelper.horizontalSpaceSmall,
                  //Cancelar
                  customeButton(
                      name: 'Yes'.tr,
                      onCallBack: () {
                        callback();
                      },
                      height: 30.h,
                      minWidth: .25.sw,
                      borderRadius: 8.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: TextFontStyle.headline16w500c799021StyleNunito
                          .copyWith(color: AppColors.white, fontSize: 12.sp),
                      context: context),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    context: context,
  );
}
