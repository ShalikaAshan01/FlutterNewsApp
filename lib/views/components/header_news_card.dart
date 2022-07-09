import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_themes.dart';
import 'package:news_app/constants/common.dart';
import 'package:news_app/models/news_response.dart';
import 'package:shimmer/shimmer.dart';

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
    final String description = article.content ?? '';
    final String image = article.urlToImage ?? '';
    return Card(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.cardRadius.r),
            child: SizedBox.expand(
                child: CachedNetworkImage(
              placeholder: (_, __) => _buildSkeletonCard(noCard: true),
              imageUrl: image,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => _buildSkeletonCard(noCard: true),
            )),
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
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Get.textTheme.bodySmall!.copyWith(color: AppThemes.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonCard({bool noCard = false}) {
    return Shimmer.fromColors(
      baseColor: AppThemes.shimmerBaseColor,
      highlightColor: AppThemes.shimmerHighlightColor,
      child: noCard
          ? Container(
              color: Colors.white,
            )
          : Card(
              child: Container(),
            ),
    );
  }
}
