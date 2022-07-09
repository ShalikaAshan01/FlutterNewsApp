import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/views/authentication/login_view.dart';

import '../../utils/authentication_manager.dart';
import '../news_list/news_list_view.dart';
import '../news_search/search_view.dart';

class DashboardController extends GetxController {
  RxList<Articles> latestNews = <Articles>[].obs;
  RxList<Articles> news = <Articles>[].obs;
  RxBool headlineLoading = false.obs;
  RxBool newsLoading = false.obs;
  RxInt activeIndex = 0.obs;
  Rx<NewsCategory> newsCategory = NewsCategory.health.obs;
  TextEditingController searchController = TextEditingController();
  final AuthenticationManager authenticationManager = AuthenticationManager.to;

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  /// Fetch initial data from the server
  Future<void> fetchInitialData() async {
    final NewsResponse? latestNewsResponse =
        await NewsServices().getTopHeadline();
    if (latestNewsResponse != null) {
      latestNews.value = (latestNewsResponse.articles ?? <Articles>[]);
    }
    fetchNews();
    headlineLoading.value = true;
  }

  /// fetch news to relevant category
  Future<void> fetchNews() async {
    newsLoading.value = false;
    final NewsResponse? newsResponse =
    await NewsServices().getTopHeadline(category: newsCategory.value);
    if (newsResponse != null) {
      news.value = newsResponse.articles ?? [];
    }
    newsLoading.value = true;
  }

  /// change the news category
  Future<void> setNewsCategory(NewsCategory category) async {
    newsCategory.value = category;
    fetchNews();
  }

  /// view everything
  void onViewAll() {
    Get.to(() => NewsListView());
  }

  /// on entering to search mode
  void onSearch() {
    if (searchController.text.length > 2) {
      Get.to(() => SearchView(), arguments: searchController.text);
      searchController.clear();
    }
  }

  /// change index of active tab
  void onPageChanged(int index) {
    activeIndex.value = index;
  }

  void onLogout() {
    authenticationManager.changeLoginStatus(false);
    Get.offAll(() => LoginView());
  }
}
