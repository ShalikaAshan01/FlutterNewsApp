import 'package:get/get.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/services/news_services.dart';

import '../news_list/news_list_view.dart';

class DashboardController extends GetxController {
  RxList<Articles> latestNews = <Articles>[].obs;
  RxList<Articles> news = <Articles>[].obs;
  RxBool headlineLoading = false.obs;
  RxBool newsLoading = false.obs;
  Rx<NewsCategory> newsCategory = NewsCategory.health.obs;

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    final NewsResponse? latestNewsResponse =
        await NewsServices().getTopHeadline();
    if (latestNewsResponse != null) {
      latestNews.value = (latestNewsResponse.articles ?? <Articles>[]);
    }
    fetchNews();
    headlineLoading.value = true;
  }

  Future<void> fetchNews() async {
    newsLoading.value = false;
    final NewsResponse? newsResponse =
        await NewsServices().getTopHeadline(category: newsCategory.value);
    if (newsResponse != null) {
      news.value = newsResponse.articles ?? [];
    }
    newsLoading.value = true;
  }

  Future<void> setNewsCategory(NewsCategory category) async {
    newsCategory.value = category;
    fetchNews();
  }

  void onViewAll() {
    Get.to(() => NewsListView(), arguments: newsCategory.value);
  }
}
