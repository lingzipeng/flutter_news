
import 'package:get/get.dart';

import '../../commom/entities/entities.dart';

class MainState {
  // 分类
  final _categories = Rx<List<CategoryResponseEntity>?>(null);
  set categories(value) => _categories.value = value;
  get categories => _categories.value;

  // 新闻翻页
  final _newsPageList = Rx<NewsPageListResponseEntity?>(null);
  set newsPageList(value) => _newsPageList.value = value;
  get newsPageList => _newsPageList.value;
  void appendNewsPageList(NewsPageListResponseEntity value) {
    if (_newsPageList.value != null) {
      _newsPageList.value!.items?.addAll(value.items!.toList());
    }
  }

  // 新闻推荐
  final _newsRecommend = Rx<NewsItem?>(null);
  set newsRecommend(value) => _newsRecommend.value = value;
  get newsRecommend => _newsRecommend.value;

  // 频道
  final _channels = Rx<List<ChannelResponseEntity>?>(null);
  set channels(value) => _channels.value = value;
  get channels => _channels.value;

  // 选中的分类Code
  final _selCategoryCode = "".obs;
  set selCategoryCode(value) => _selCategoryCode.value = value;
  get selCategoryCode => _selCategoryCode.value;
}
