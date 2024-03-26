import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class NotfoundPage extends GetView<NotfoundController> {
  const NotfoundPage({super.key});

  // 内容页
  Widget _buildView() {
    return const HellowordWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }
}
