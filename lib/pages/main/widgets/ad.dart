import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commom/values/borders.dart';
import '../../../commom/values/colors.dart';
import '../../../commom/values/radii.dart';
import '../index.dart';

/// ad广告
class AdWidget extends GetView<MainController> {
  const AdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.w,
      padding: EdgeInsets.all(20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(Borders.primaryBorder),
          borderRadius: Radii.k6pxRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "厌倦了广告？获取高级版 - \$9.99",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                height: 18.sp / 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
