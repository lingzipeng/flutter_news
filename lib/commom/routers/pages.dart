import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/application/bindings.dart';
import '../../pages/application/view.dart';
import '../../pages/category/bindings.dart';
import '../../pages/category/view.dart';
import '../../pages/frame/sign_in/bindings.dart';
import '../../pages/frame/sign_in/view.dart';
import '../../pages/frame/sign_up/bindings.dart';
import '../../pages/frame/sign_up/view.dart';
import '../../pages/frame/welcome/bindings.dart';
import '../../pages/frame/welcome/view.dart';
import '../middlewares/router_auth.dart';
import '../middlewares/router_welcome.dart';
import 'routes.dart';
class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
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
      page: () => ApplicationPage(),
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
  ];
}