import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_themes.dart';
import 'package:news_app/constants/common.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/views/news_details/news_details_view.dart';

import 'skeleton_card.dart';

///
/// header news card for the app if the article is null ui will load the skeleton view
///
class HeaderNewsCard extends StatelessWidget {
  const HeaderNewsCard({Key? key, this.article}) : super(key: key);
  final Articles? article;

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return _buildSkeletonCard();
    }
    return _buildNewsCard();
  }

  Widget _buildNewsCard() {
    final Articles article = this.article!;
    final String author = article.author ?? '';
    final String title = article.title ?? '';
    final String image = article.urlToImage ?? '';
    return GestureDetector(
      onTap: () => Get.to(() => NewsDetailsView(article: article)),
      child: Card(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppBorderRadius.cardRadius.r),
              child: Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.5, 0.5, 1],
                  ),
                ),
                child: SizedBox.expand(
                    child: image.isEmpty
                        ? _buildSkeletonCard(noCard: true)
                        : CachedNetworkImage(
                            placeholder: (_, __) =>
                                _buildSkeletonCard(noCard: true),
                            imageUrl: image,
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) =>
                                _buildSkeletonCard(noCard: true),
                          )),
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(
                  horizontal: Insets.horizontalScreenPadding,
                  vertical: Insets.verticalBetweenPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  if (author.isNotEmpty)
                    Text(
                      'By $author',
                      style: Get.textTheme.titleMedium!
                          .copyWith(color: AppThemes.white),
                    ),
                  Text(
                    title,
                    style: Get.textTheme.titleLarge!
                        .copyWith(color: AppThemes.white),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonCard({bool noCard = false}) {
    return SkeletonCard(card: !noCard);
  }
}
