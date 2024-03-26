import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  // 内容页
  Widget _buildView() {
    return const Text('dfg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }
}
