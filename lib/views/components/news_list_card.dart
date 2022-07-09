import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/views/components/skeleton_card.dart';
import 'package:news_app/views/news_details/news_details_view.dart';

import '../../constants/common.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({Key? key, this.article}) : super(key: key);
  final Articles? article;

  @override
  Widget build(BuildContext context) {
    final Articles article = this.article!;
    final String image = article.urlToImage ?? '';
    final String author = article.author ?? '';
    final String title = article.title ?? '';
    final String content = article.content ?? article.description ?? '';
    final DateTime? date = article.publishedAt;
    final double padding = Insets.verticalBetweenPadding.r;
    return GestureDetector(
      onTap: () => Get.to(() => NewsDetailsView(article: article)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.cardRadius.r),
            child: SizedBox(
                height: 150.h,
                width: double.infinity,
                child: image.isEmpty
                    ? const SkeletonCard(card: false)
                    : CachedNetworkImage(
                        placeholder: (_, __) => const SkeletonCard(card: false),
                        imageUrl: image,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) =>
                            const SkeletonCard(card: false),
                      )),
          ),
          if (date != null)
            Padding(
              padding: EdgeInsets.only(top: padding),
              child: Text(
                DateFormat("EEEE, dd MMM yyyy").format(date),
                textAlign: TextAlign.end,
                style: Get.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
            ),
          SizedBox(height: padding),
          Text(
            title,
            style: Get.textTheme.titleMedium,
          ),
          SizedBox(height: padding),
          Text(
            content,
            style: Get.textTheme.bodyMedium,
          ),
          if (author.isNotEmpty)
            Padding(
                padding: EdgeInsets.only(top: padding),
                child: Text(
                  'Published by $author',
                  style: Get.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                )),
        ],
      ),
    );
  }
}
