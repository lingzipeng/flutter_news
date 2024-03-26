import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commom/apis/user.dart';
import '../../../commom/entities/user.dart';
import '../../../commom/utils/security.dart';
import '../../../commom/widgets/toast.dart';
import 'index.dart';

class SignUpController extends GetxController {
  SignUpController();

  /// obs 响应式变量 才写入 state
  final state = SignUpState();

  /// 业务变量

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  /// 业务事件

  // 返回上一页
  handleNavPop() {
    Get.back();
  }

  // 提示信息
  handleTip() {
    toastInfo(msg: '这是注册界面');
  }

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: '忘记密码');
  }

  // 执行注册操作
  handleSignUp() async {

    UserRegisterRequestEntity params = UserRegisterRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );

    await UserAPI.register(
      params: params,
    );

    Get.back();
  }

  /// 生命周期

  // 页面载入完成
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
