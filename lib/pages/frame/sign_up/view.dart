import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../commom/values/colors.dart';
import '../../../commom/widgets/widgets.dart';
import 'index.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: 295.w,
      // height: 204,
      margin: EdgeInsets.only(top: 49.h),
      child: Column(
        children: [
          // fullName input
          inputTextEdit(
            controller: controller.fullnameController,
            keyboardType: TextInputType.text,
            hintText: "名字",
            marginTop: 0,
          ),
          // email input
          inputTextEdit(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "邮箱",
          ),
          // password input
          inputTextEdit(
            controller: controller.passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "密码",
            isPassword: true,
          ),

          // 创建
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 15.h),
            child: btnFlatButtonWidget(
              onPressed: controller.handleSignUp,
              width: 295.w,
              fontWeight: FontWeight.w600,
              title: "创建账号",
            ),
          ),
          // Spacer(),

          // Fogot password
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: controller.handleFogotPassword,
              child: Text(
                "忘记密码?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "其他登录",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnFlatButtonWidget(
        onPressed: controller.handleNavPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "已有账号",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: controller.handleNavPop,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: controller.handleTip,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Divider(height: 0.5,color: AppColors.thirdElementText),
            _buildLogo(),
            _buildInputForm(),
            const Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
