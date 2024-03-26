import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/application/bindings.dart';
import '../../pages/application/view.dart';
import '../../pages/category/bindings.dart';
import '../../pages/category/view.dart';
import '../../pages/frame/sign_in/index.dart';
import '../../pages/frame/sign_up/index.dart';
import '../../pages/frame/welcome/index.dart';
import '../../pages/my/index.dart';
import '../../pages/video/index.dart';
import '../middlewares/middlewares.dart';
import 'routes.dart';
class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    // 需要登录
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    // 分类列表
    GetPage(
      name: AppRoutes.Category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
    //我的列表
    GetPage(
      name: AppRoutes.My,
      page: () => MyPage(),
      binding: MyBinding(),
    ),
    //视频的列表
    GetPage(
      name: AppRoutes.Video,
      page: () => VideoPage(),
      binding: VideoBinding(),
    ),
  ];
}