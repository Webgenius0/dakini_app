import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../constants/text_font_style.dart';
import '../../../../../gen/colors.gen.dart';

class OtpVerificationWidget extends StatefulWidget {
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onCompleted;
  final ValueChanged<dynamic>? onSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int length;

  const OtpVerificationWidget({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.onSubmitted,
    required this.length,
    this.controller,
    this.validator,
  });

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r))),
      child: PinCodeTextField(
        controller: widget.controller,
        enablePinAutofill: true,
        keyboardType: TextInputType.number,
        appContext: context,
        length: widget.length,
        animationType: AnimationType.fade,
        cursorColor: AppColors.allPrimaryColor,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderWidth: 1.5,
          borderRadius: BorderRadius.circular(10.r),
          fieldHeight: 63.h,
          fieldWidth: 45.w,
          // activeFillColor: AppColors.allPrimaryColor,
          // inactiveFillColor: AppColors.cE8ECF4,
          // selectedFillColor: AppColors.allPrimaryColor,
          activeColor: AppColors.allPrimaryColor, //const Color(0xFFF4F5F7),
          inactiveColor: AppColors.c727175, // const Color(0xFFF4F5F7),
          selectedColor: AppColors.allPrimaryColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: false,
        onCompleted: widget.onCompleted ?? (value) {},
        onChanged: widget.onChanged ?? (value) {},
        onSubmitted: widget.onSubmitted ?? (value) {},
        textStyle: TextFontStyle.headline20w400c727175StyleNunito
            .copyWith(fontSize: 16.sp),
        validator: widget.validator,
        // .copyWith(decoration: TextDecoration.underline)
      ),
    );
  }
}
