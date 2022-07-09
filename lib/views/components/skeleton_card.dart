import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/app_themes.dart';

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({Key? key, required this.card}) : super(key: key);
  final bool card;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppThemes.shimmerBaseColor,
      highlightColor: AppThemes.shimmerHighlightColor,
      child: !card
          ? Container(
              color: Colors.white,
            )
          : Card(
              child: Container(),
            ),
    );
  }
}
