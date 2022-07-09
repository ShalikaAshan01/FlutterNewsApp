import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/extensions/string_extension.dart';
import 'package:news_app/models/news_languages.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/news_sort_by.dart';
import 'package:news_app/views/news_search/filter_view.dart';

import '../../services/news_services.dart';

class SearchController extends GetxController {
  RxInt totalResults = 0.obs;
  RxString searchText = ''.obs;
  RxString newsCategory = ''.obs;
  Rx<NewsSortBy?> newsSortBy = NewsSortBy.publishedAt.obs;
  Rx<NewsLanguages> newsLanguage = NewsLanguages.none.obs;
  TextEditingController searchController = TextEditingController();
  final PagingController<int, Articles> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    dynamic argumentData = Get.arguments;
    if (argumentData is String) {
      searchText.value = argumentData;
      searchController.text = argumentData;
    }
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      this.totalResults.value = 0;
      final res = await NewsServices().getTopHeadline(
          category: newsCategory.value.getCategory(),
          page: pageKey,
          text: searchText.value,
          language: newsLanguage.value,
          sortBy: newsSortBy.value);
      final List<Articles> newItems = res?.articles ?? <Articles>[];
      final int totalResults = res?.totalResults ?? 0;
      final isLastPage = totalResults <= (pageKey * 20);
      this.totalResults.value = totalResults;
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

  void setCategory(String category) {
    if (category == newsCategory.value) {
      newsCategory.value = '';
    } else {
      newsCategory.value = category;
    }
    pagingController.refresh();
  }

  void onSearch() {
    searchText.value = searchController.text;
    pagingController.refresh();
  }

  Future<void> showFilter() async {
    Get.bottomSheet(const FilterView());
  }

  void onFilterSave(NewsSortBy? newsSortBy, NewsLanguages? newsLanguages) {
    this.newsSortBy.value = newsSortBy;
    if (newsLanguages == null) {
      newsLanguage.value = NewsLanguages.none;
    } else {
      newsLanguage.value = newsLanguages;
    }
    Get.back();
    pagingController.refresh();
  }
}
