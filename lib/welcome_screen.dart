import 'package:dakini1/constants/text_font_style.dart';
import 'package:dakini1/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gen/assets.gen.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UIHelper.verticalSpace(40.h),
            Image.asset(
              Assets.icons.dakiniAppLogo.path,
              width: 90.w,
              height: 196.h,
            ),
            Text('Alunar',
                textAlign: TextAlign.center,
                style: TextFontStyle.headline62w600c1C1C1CStylePlayfairDisplay),
            UIHelper.verticalSpace(10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Una herramienta de ',
                      style: TextFontStyle.headline16w500c799021StyleNunito),
                  TextSpan(
                      text: 'SintoniaDiosa',
                      style: TextFontStyle.headline16w600c799021StyleNunito),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
