import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 分类导航
class NewsCategoriesWidget extends GetView<MainController> {
  const NewsCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.state.categories == null
          ? Container()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.state.categories.map<Widget>((item) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
