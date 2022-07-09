import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/views/components/skeleton_card.dart';
import 'package:news_app/views/news_details/news_details_view.dart';

import '../../constants/app_themes.dart';
import '../../constants/common.dart';
import '../../models/news_response.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, this.article}) : super(key: key);

  final Articles? article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: article == null ? _buildSkeletonCard() : _buildNewsCard(),
    );
  }

  Widget _buildNewsCard() {
    final Articles article = this.article!;
    final String author = article.author ?? '';
    final String title = article.title ?? '';
    final DateTime? date = article.publishedAt;
    final String image = article.urlToImage ?? '';
    return Card(
      child: GestureDetector(
        onTap: () {
          Get.to(() => NewsDetailsView(article: article));
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppBorderRadius.cardRadius.r),
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
            Padding(
              padding: REdgeInsets.symmetric(
                  horizontal: Insets.horizontalScreenPadding,
                  vertical: Insets.verticalBetweenPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Get.textTheme.titleMedium!
                        .copyWith(color: AppThemes.white),
                    maxLines: 3,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (author.isNotEmpty)
                        Expanded(
                          flex: 2,
                          child: Text(
                            author,
                            maxLines: 1,
                            style: Get.textTheme.titleSmall!
                                .copyWith(color: AppThemes.white),
                          ),
                        )
                      else
                        const Spacer(),
                      if (date != null)
                        Text(
                          DateFormat("EEEE, dd MMM yyyy").format(date),
                          textAlign: TextAlign.end,
                          style: Get.textTheme.titleSmall!
                              .copyWith(color: AppThemes.white),
                        ),
                    ],
                  )
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
