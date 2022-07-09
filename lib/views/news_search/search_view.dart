import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/extensions/string_extension.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/views/components/custom_button.dart';

import '../../constants/common.dart';
import '../../models/news_category.dart';
import '../components/category_button.dart';
import '../components/news_card.dart';
import 'search_controller.dart';

/// News list view
class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: REdgeInsets.symmetric(
                horizontal: Insets.horizontalScreenPadding.r),
            child: Obx(() => _buildBody())),
      ),
    );
  }

  /// Build the body section of search view.
  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.h,
          child: TextField(
            controller: _searchController.searchController,
            onEditingComplete: () => _searchController.onSearch(),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                hintText: 'Search news...',
                suffixIcon: GestureDetector(
                    onTap: () => Get.back(), child: const Icon(Icons.close))),
          ),
        ),
        _buildCategoryButtons(),
        Padding(
          padding:
              REdgeInsets.symmetric(vertical: Insets.verticalBetweenPadding.r),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text:
                        '  About ${_searchController.totalResults.value} results for '),
                //this is a small trick to update the value of category
                TextSpan(
                    text:
                        '${_searchController.searchText}.${_searchController.newsCategory.value.isNotEmpty ? '' : ''}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ],
              style: Get.textTheme.bodyMedium,
            ),
          ),
        ),
        Expanded(
          child: PagedListView<int, Articles>(
            pagingController: _searchController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Articles>(
              firstPageProgressIndicatorBuilder: (_) =>
                  _firstPageProgressIndicator(),
              itemBuilder: (context, item, index) => NewsCard(
                article: item,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the category buttons.
  Widget _buildCategoryButtons() {
    return SizedBox(
      height: 45.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: NewsCategory.values.length + 1,
        itemBuilder: (BuildContext context, int index) {
          index = index - 1;
          if (index == -1) {
            return CustomButton(
              onPressed: _searchController.showFilter,
              text: 'Filter',
              selected: true,
              icon: Icons.filter_alt_outlined,
            );
          }
          NewsCategory category = NewsCategory.values[index];
          return CategoryButton(
              category: category,
              onPressed: () => _searchController
                  .setCategory(category.toString().enumToString()),
              selected: category ==
                  _searchController.newsCategory.value.getCategory());
        },
      ),
    );
  }

  /// Skeleton for the initial loading state
  Widget _firstPageProgressIndicator() {
    return Column(
      children: const <Widget>[
        NewsCard(),
        NewsCard(),
        NewsCard(),
        NewsCard(),
        NewsCard(),
        NewsCard(),
        NewsCard(),
        NewsCard(),
      ],
    );
  }
}
