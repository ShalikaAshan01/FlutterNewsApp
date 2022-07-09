import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/models/news_response.dart';

import '../../models/news_category.dart';
import '../../services/news_services.dart';

class NewsListController extends GetxController {
  Rx<NewsCategory> category = NewsCategory.general.obs;
  final PagingController<int, Articles> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    dynamic argumentData = Get.arguments;
    if (argumentData is NewsCategory) {
      category.value = argumentData;
    }
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final res = await NewsServices()
          .getTopHeadline(category: category.value, page: pageKey);
      final List<Articles> newItems = res?.articles ?? <Articles>[];
      final int totalResults = res?.totalResults ?? 0;
      final isLastPage = totalResults <= (pageKey * 20);
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
