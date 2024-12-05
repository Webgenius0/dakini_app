import 'package:dakini1/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton(
      {super.key,
      this.width,
      this.height,
      this.fillColor,
      this.borderColor,
      this.borderRedius,
      this.padding,
      required this.child,
      this.onTap});
  final double? width;
  final double? height;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRedius;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(12.sp),
        width: width ?? double.infinity,
        height: height ?? 56.sp,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? AppColors.allPrimaryColor),
          color: fillColor ?? AppColors.allPrimaryColor,
          borderRadius: BorderRadius.circular(borderRedius ?? 12.r),
        ),
        child: child,
      ),
    );
  }
}
