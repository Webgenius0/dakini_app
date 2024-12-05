import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final String? hintText;
  final String? selectedValue;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final double borderWidth;
  final double iconSize;
  final Color borderColor;
  final Color iconColor;
  final Color? popupMenuColor;
  final TextStyle? textStyle;

  const CustomDropdownButton({
    super.key,
    required this.items,
    this.hintText,
    this.selectedValue,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 16),
    this.borderRadius = 48.0,
    this.borderWidth = 0.5,
    this.iconSize = 24.0,
    this.borderColor = AppColors.c727175,
    this.iconColor = Colors.black45,
    this.textStyle,
    this.popupMenuColor,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderColor,
            width: (borderWidth + 0.5).w,
          ),
        ),
      ),
      hint: hintText != null
          ? SizedBox(
              child: Text(
                hintText!,
                style: textStyle ??
                    TextFontStyle.headline20w400c727175StyleNunito
                        .copyWith(fontSize: 16.sp),
                overflow: TextOverflow.ellipsis,
              ),
            )
          : null,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: textStyle ??
                      TextFontStyle.headline20w400c727175StyleNunito
                          .copyWith(fontSize: 16.sp),
                ),
              ))
          .toList(),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.only(right: 0.w),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: iconColor,
        ),
        iconSize: iconSize,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200.h,
        decoration: BoxDecoration(
          color: popupMenuColor ?? AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(15.r),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.c727175),
          trackColor: WidgetStateProperty.all(Colors.grey.shade300),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}
