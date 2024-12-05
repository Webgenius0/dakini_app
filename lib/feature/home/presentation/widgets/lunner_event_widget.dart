import 'package:dakini1/constants/text_font_style.dart';
import 'package:dakini1/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LunnerEventWidget extends StatelessWidget {
  const LunnerEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.sp),
      decoration: ShapeDecoration(
        color: const Color(0xFF799021),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Luna Llena en Aries 16:07',
                  style:
                      TextFontStyle.headline16w500c799021StyleNunito.copyWith(
                    color: AppColors.cFFFFFF,
                    fontSize: 18.sp,
                  ),
                ),
                Text('Me celebro y me regalo eso que he posttergado',
                    style:
                        TextFontStyle.headline16w500c799021StyleNunito.copyWith(
                      color: AppColors.cFFFFFF,
                      fontSize: 12.sp,
                    ))
              ],
            ),
          ),
          Container(
            width: 36.w,
            height: 36.h,
            decoration: const ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(width: 2, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
