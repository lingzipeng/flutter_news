import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../../commom/routers/names.dart';
import '../../commom/values/colors.dart';
import 'index.dart';

class ApplicationController extends GetxController {
  ApplicationController();

  /// 响应式成员变量

  final state = ApplicationState();

  /// 成员变量

  // tab 页标题
  late final List<String> tabTitles;

  // 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  /// scheme 内部打开
  bool isInitialUriIsHandled = false;
  StreamSubscription? uriSub;

  // 第一次打开
  Future<void> handleInitialUri() async {
    if (!isInitialUriIsHandled) {
      isInitialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          // 这里获取了 scheme 请求
          print('got initial uri: $uri');
        }
      } on PlatformException {
        print('falied to get initial uri');
      } on FormatException catch (err) {
        print('malformed initial uri, ' + err.toString());
      }
    }
  }

  // 程序打开时介入
  void handleIncomingLinks() {
    if (!kIsWeb) {
      uriSub = uriLinkStream.listen((Uri? uri) {
        // 这里获取了 scheme 请求
        print('got uri: $uri');

        // if (uri!.pathSegments[1].toLowerCase() == 'category') {
        if (uri != null && uri.path == '/notify/category') {
          Get.toNamed(AppRoutes.Category);
        }
      }, onError: (Object err) {
        print('got err: $err');
      });
    }
  }

  /// 生命周期

  @override
  void onInit() {
    // handleInitialUri();
    // handleIncomingLinks();

    // 准备一些静态数据
    tabTitles = ['Welcome', 'Category', 'Bookmarks', 'Account'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          // Iconfont.home,
          Icons.home,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.home,
          color: AppColors.secondaryElementText,
        ),
        // icon: Image.asset(
        //   "assets/tabbar_mainframe@3x.png",
        //     width: 25.0, height: 25.0
        // ),
        // activeIcon: Image.asset(
        //   "assets/tabbar_mainframeHL@3x.png",
        // ),
        label: 'main',
        backgroundColor: AppColors.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.shop,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.shop,
          color: AppColors.secondaryElementText,
        ),
        label: 'category',
        backgroundColor: AppColors.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.tab,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.tab,
          color: AppColors.secondaryElementText,
        ),
        label: 'tag',
        backgroundColor: AppColors.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.manage_accounts,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.manage_accounts,
          color: AppColors.secondaryElementText,
        ),
        label: 'my',
        backgroundColor: AppColors.primaryBackground,
      ),
    ];
    pageController = PageController(initialPage: state.page);
    // print("==========");
    // for (var item in bottomTabs) {
    //   print('Icon: ${item.icon}, Active Icon: ${item.activeIcon}, Label: ${item.label}');
    // }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    uriSub?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
