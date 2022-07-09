import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/models/news_response.dart';

import '../../services/news_services.dart';

class NewsListController extends GetxController {
  final PagingController<int, Articles> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final res = await NewsServices().getEverything(page: pageKey);
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
