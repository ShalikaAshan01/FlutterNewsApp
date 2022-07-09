import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/common.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/views/components/frosted_widget.dart';
import 'package:news_app/views/components/skeleton_card.dart';

///
/// This is the news details view.
///
class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({Key? key, required this.article}) : super(key: key);
  final Articles article;
  static const String routeName = '/news_details';

  @override
  Widget build(BuildContext context) {
    final double topSectionHeight = ScreenUtil().screenHeight * 0.5;
    final double titleHeight = 250.h;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
                width: ScreenUtil().screenWidth,
                height: topSectionHeight,
                child: _buildTop()),
            Column(
              children: [
                SizedBox(
                  height: topSectionHeight - titleHeight / 2,
                ),
                SizedBox(
                    width: ScreenUtil().screenWidth,
                    child: _buildContent(titleHeight)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: topSectionHeight - titleHeight),
              child: _buildTitle(titleHeight),
            ),
          ],
        ),
      ),
    );
  }

  /// build top app bar with image
  Widget _buildTop() {
    final String image = article.urlToImage ?? '';
    return Stack(
      children: <Widget>[
        SizedBox.expand(
            child: image.isEmpty
                ? const SkeletonCard(card: false)
                : CachedNetworkImage(
                    placeholder: (_, __) => const SkeletonCard(card: false),
                    imageUrl: image,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) =>
                        const SkeletonCard(card: false),
                  )),
        Positioned(
          top: Insets.extraLarge.r,
          left: Insets.large.r * 1.5,
          child: SizedBox(
              height: Insets.extraLarge.r * 1.25,
              width: Insets.extraLarge.r * 1.25,
              child: FrostedWidget(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: REdgeInsets.only(left: Insets.extraLarge.r * .25),
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }

  /// blurred title section of the news details
  Widget _buildTitle(double height) {
    final String author = article.author ?? '';
    final String title = article.title ?? '';
    final DateTime? date = article.publishedAt;
    String strDate = '';
    if (date != null) {
      strDate = DateFormat("EEEE, dd MMM yyyy").format(date);
    }
    final TextStyle dateStyle =
        Get.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w900);
    return Container(
      height: height,
      padding: REdgeInsets.symmetric(horizontal: Insets.extraLarge.r * 1.5),
      child: FrostedWidget(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: Insets.extraLarge.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strDate,
                style: dateStyle,
              ),
              Text(
                title,
                style: Get.textTheme.titleLarge!.copyWith(),
              ),
              if (author.isNotEmpty)
                Text(
                  'Published by $author',
                  style: dateStyle,
                )
            ],
          ),
        ),
      ),
    );
  }

  /// this is the content section of the news details
  Widget _buildContent(double titleHeight) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.theme.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
          vertical: titleHeight * .6,
          horizontal: Insets.horizontalScreenPadding),
      child: Text(article.description ?? ''),
    );
  }
}
