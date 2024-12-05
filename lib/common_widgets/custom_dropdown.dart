// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class MyCustomDropdown extends StatefulWidget {
  final String? selectedValue;
  final List<String> dropDownValue;
  final Function(String?)? onChange;
  final double horizonPadding;
  final double verticPadding;
  final String? hinttext;
  final String? hintIcon;
  final bool isImageNull;
  final double? width;
  final double? height;

  const MyCustomDropdown({
    super.key,
    required this.selectedValue,
    required this.dropDownValue,
    this.horizonPadding = 15,
    this.verticPadding = 4,
    this.hinttext,
    this.onChange,
    this.hintIcon,
    required this.isImageNull,
    this.width,
    this.height,
  });

  @override
  _MyCustomDropdownState createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends State<MyCustomDropdown> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Focus(
        focusNode: _focusNode,
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizonPadding.w,
              vertical: widget.verticPadding),
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            border: Border.all(
              color:
                  _focusNode.hasFocus ? AppColors.cFFFFFF : AppColors.cFFFFFF,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Row(
                children: [
                  widget.isImageNull
                      // ? Image.asset(
                      //     widget.hintIcon ?? "",
                      //     width: widget.isImageNull ? 0 : 26.w,
                      //   )
                      ? Icon(
                          Icons.arrow_drop_down,
                          size: 20.sp,
                        )
                      : const SizedBox.shrink(),
                  UIHelper.horizontalSpace(10.w),
                  Text(
                    "${widget.hinttext}",
                    style: TextFontStyle.headline20w400c727175StyleNunito
                        .copyWith(color: AppColors.cFFFFFF),
                  ),
                ],
              ),
              isExpanded: true,
              value: widget.selectedValue,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 22.sp,
              ),
              items: widget.dropDownValue
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value.toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                widget.onChange?.call(newValue);
                FocusScope.of(context).requestFocus(_focusNode);
              },
              dropdownColor: AppColors.cFFFFFF,
            ),
          ),
        ),
      ),
    );
  }
}
