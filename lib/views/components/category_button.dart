import 'package:flutter/material.dart';
import 'package:news_app/extensions/string_extension.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/views/components/custom_button.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {Key? key, this.onPressed, this.selected = false, required this.category})
      : super(key: key);
  final VoidCallback? onPressed;
  final bool selected;
  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      selected: selected,
      text: category.toString().enumToString().capitalizeFirstLetter(),
      onPressed: onPressed,
    );
  }
}
