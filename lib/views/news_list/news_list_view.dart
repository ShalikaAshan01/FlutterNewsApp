import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/views/components/news_list_card.dart';

import '../../constants/common.dart';
import 'news_list_controller.dart';

/// News list view
class NewsListView extends StatelessWidget {
  NewsListView({Key? key}) : super(key: key);
  final NewsListController _newsListController = Get.put(NewsListController());
  static const String routeName = '/news-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: REdgeInsets.symmetric(
                horizontal: Insets.horizontalScreenPadding.r),
            child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios)),
            Expanded(
                child: Text(
              'Latest News',
              style: Get.textTheme.titleLarge!
                  .copyWith(color: Get.theme.primaryColor),
              textAlign: TextAlign.center,
            )),
          ],
        ),
        Expanded(
          child: PagedListView<int, Articles>(
            pagingController: _newsListController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Articles>(
              firstPageProgressIndicatorBuilder: (_) =>
                  _firstPageProgressIndicator(),
              itemBuilder: (context, item, index) => Padding(
                padding: REdgeInsets.symmetric(
                    vertical: Insets.verticalBetweenPadding.r),
                child: NewsListCard(
                  article: item,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstPageProgressIndicator() {
    return Column(
      children: const <Widget>[
        NewsListCard(),
        NewsListCard(),
        NewsListCard(),
      ],
    );
  }
}
