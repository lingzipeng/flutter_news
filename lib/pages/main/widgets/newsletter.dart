import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../commom/values/colors.dart';
import '../../../commom/widgets/toast.dart';
import '../index.dart';

/// 邮件订阅
class NewsletterWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        children: <Widget>[
          // newsletter
          Row(
            children: <Widget>[
              Text(
                '双十一优惠大放送，点击查看详情',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.thirdElement,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.thirdElementText,
                  size: 17.sp,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // email
          // inputEmailEdit(
          //   marginTop: 19,
          //   keyboardType: TextInputType.emailAddress,
          //   hintText: "Email",
          //   isPassword: false,
          //   controller: null,
          // ),

          // btn subcrible
          // Padding(
          //   padding: const EdgeInsets.only(top: 15),
          //   child: btnFlatButtonWidget(
          //     onPressed: () {},
          //     width: 335.w,
          //     height: 44.h,
          //     fontWeight: FontWeight.w600,
          //     title: "Subscribe",
          //   ),
          // ),

          // disc
          Container(
            margin: EdgeInsets.only(top: 29.h),
            width: 261.w,
            child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                text: '以上产品解释权归公司所有',
                style: TextStyle(
                  color: AppColors.thirdElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    toastInfo(msg: 'Privacy Policy');
                  },
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
