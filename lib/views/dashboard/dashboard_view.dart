import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_themes.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/views/components/category_button.dart';
import 'package:news_app/views/components/header_news_card.dart';
import 'package:news_app/views/components/news_card.dart';
import 'package:news_app/views/dashboard/dashboard_controller.dart';

import '../../constants/common.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(
                  horizontal: Insets.horizontalScreenPadding.r),
              child: _buildBody()[_dashboardController.activeIndex.value],
            ),
          ),
          floatingActionButton: _bottomAppBar(),
        ));
  }

  /// Builds the body of the dashboard. This includes the all tabs of the dashboard.
  List<Widget> _buildBody() {
    return [
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: ScreenUtil().screenHeight * .35, child: _buildTop()),
            Padding(
                padding: REdgeInsets.symmetric(
                    vertical: Insets.verticalBetweenPadding.r * .25),
                child: _buildCategoryButtons()),
            _buildNewsList()
          ],
        ),
      ),
      _favorite(),
      _account()
    ];
  }

  /// Builds the top of the dashboard. This includes the header and the search bar.
  Widget _buildTop() {
    if (_dashboardController.headlineLoading.isTrue &&
        _dashboardController.latestNews.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: TextField(
                  controller: _dashboardController.searchController,
                  onEditingComplete: () => _dashboardController.onSearch(),
                  decoration: InputDecoration(
                      hintText: 'Search news...',
                      suffixIcon: GestureDetector(
                          onTap: _dashboardController.onSearch,
                          child: const Icon(Icons.search))),
                ),
              ),
            ),
            Card(
              color: Get.theme.primaryColor,
              shape: const CircleBorder(),
              child: Padding(
                padding: REdgeInsets.all(Insets.large.r),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppThemes.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: Insets.verticalBetweenPadding.r),
        Row(
          children: <Widget>[
            Text(
              ' Latest News',
              style: Get.textTheme.titleLarge,
            ),
            const Spacer(),
            GestureDetector(
              onTap: _dashboardController.onViewAll,
              child: Row(
                children: <Widget>[
                  Text(
                    'See All',
                    style: Get.textTheme.labelSmall!
                        .copyWith(color: Get.theme.primaryColorLight),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Get.theme.primaryColorLight,
                  ),
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: _buildTopNews(),
        )
      ],
    );
  }

  /// Builds the top news of the header
  Widget _buildTopNews() {
    if (!_dashboardController.headlineLoading.value) {
      return const HeaderNewsCard();
    }
    return PageView.builder(
      padEnds: false,
      controller: PageController(
        viewportFraction: 0.95,
        initialPage: 0,
      ),
      itemCount: _dashboardController.latestNews.length,
      itemBuilder: (BuildContext context, int index) {
        return HeaderNewsCard(
          article: _dashboardController.latestNews[index],
        );
      },
    );
  }

  /// Builds the category buttons of the dashboard.
  Widget _buildCategoryButtons() {
    return SizedBox(
      height: 45.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: NewsCategory.values.length,
        itemBuilder: (BuildContext context, int index) {
          NewsCategory category = NewsCategory.values[index];
          return CategoryButton(
            category: category,
            onPressed: () => _dashboardController.setNewsCategory(category),
            selected: category == _dashboardController.newsCategory.value,
          );
        },
      ),
    );
  }

  /// Builds the news list of the dashboard. This is related to the selected category.
  Widget _buildNewsList() {
    if (_dashboardController.newsLoading.isFalse) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const NewsCard();
        },
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _dashboardController.news.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(
          article: _dashboardController.news[index],
        );
      },
    );
  }

  Widget _bottomAppBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300.h),
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(
              horizontal: Insets.extraLarge.r, vertical: Insets.large.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _bottomNavigationBarItem('Home', Icons.home_outlined, 0),
              _bottomNavigationBarItem('Favorite', Icons.favorite_border, 1),
              _bottomNavigationBarItem(
                  'Profile', Icons.emoji_emotions_outlined, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBarItem(String text, IconData iconData, int index) {
    final bool isActive = _dashboardController.activeIndex.value == index;
    Color color = isActive ? Get.theme.primaryColor : const Color(0xFF818181);
    return GestureDetector(
      onTap: () => _dashboardController.onPageChanged(index),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: Insets.large.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _favorite() {
    return const Center(
      child: Text('Favorite'),
    );
  }

  Widget _account() {
    return const Center(
      child: Text('Account'),
    );
  }
}
