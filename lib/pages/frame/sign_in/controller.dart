import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commom/apis/user.dart';
import '../../../commom/entities/user.dart';
import '../../../commom/routers/names.dart';
import '../../../commom/store/user.dart';
import '../../../commom/utils/security.dart';
import '../../../commom/widgets/toast.dart';
import 'index.dart';

class SignInController extends GetxController {
  final state = SignInState();

  SignInController();

  // email的控制器
  final TextEditingController emailController = TextEditingController();
  // 密码的控制器
  final TextEditingController passController = TextEditingController();

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: '忘记密码');
  }

  // 执行登录操作
  handleSignIn() async {

    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    UserStore.to.saveProfile(userProfile);

    Get.offAndToNamed(AppRoutes.Application);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
