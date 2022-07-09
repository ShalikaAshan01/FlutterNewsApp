import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_themes.dart';
import 'package:news_app/constants/common.dart';
import 'package:news_app/extensions/string_extension.dart';
import 'package:news_app/models/news_category.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {Key? key, this.onPressed, this.selected = false, required this.category})
      : super(key: key);
  final VoidCallback? onPressed;
  final bool selected;
  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    //
    Color backgroundColor = Get.theme.primaryColor;
    Color borderColor = backgroundColor;
    TextStyle textStyle =
        Get.textTheme.labelMedium!.copyWith(color: AppThemes.white);
    if (!selected) {
      textStyle = Get.textTheme.labelMedium!;
      borderColor = Get.theme.primaryColorDark;
      backgroundColor = AppThemes.white;
    }
    final BorderRadius borderRadius =
        BorderRadius.circular(AppBorderRadius.buttonRadius.r);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 5.r),
      child: Material(
        elevation: 1,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: backgroundColor,
                border: Border.all(color: borderColor)),
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            alignment: Alignment.center,
            child: Text(
              category.toString().enumToString().capitalizeFirstLetter(),
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
