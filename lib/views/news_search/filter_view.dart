import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_themes.dart';
import 'package:news_app/constants/common.dart';
import 'package:news_app/models/news_languages.dart';
import 'package:news_app/models/news_sort_by.dart';

import '../../models/news_country.dart';
import 'search_controller.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  NewsSortBy? _newsSortBy;
  NewsLanguages? _newsLanguage;
  NewsCountry? _newsCountry;
  final SearchController _searchController = Get.put(SearchController());
  final Color color = const Color(0xFF041E2F);

  @override
  void initState() {
    super.initState();
    _newsSortBy = _searchController.newsSortBy.value;
    _newsLanguage = _searchController.newsLanguage.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(Insets.verticalBetweenPadding.r),
      decoration: BoxDecoration(
          color: Get.theme.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppBorderRadius.buttonRadius.r),
              topRight: Radius.circular(AppBorderRadius.buttonRadius.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Filter',
                style: Get.textTheme.titleLarge!.copyWith(color: color),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemes.white, side: BorderSide(color: color)),
                  onPressed: _reset,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline_sharp,
                        color: color,
                      ),
                      Text(
                        'Reset',
                        style: TextStyle(color: color),
                      )
                    ],
                  ))
            ],
          ),
          Expanded(child: _buildBody()),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => _searchController.onFilterSave(
                      _newsSortBy, _newsLanguage, _newsCountry),
                  child: Padding(
                    padding: REdgeInsets.all(Insets.medium.r),
                    child: const Text('Save'),
                  )))
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Sort By',
            style: Get.textTheme.titleMedium!.copyWith(color: color),
          ),
          _buildSortBy(),
          Text(
            'Language',
            style: Get.textTheme.titleMedium!.copyWith(color: color),
          ),
          _buildLanguage(),
          Text(
            'Country',
            style: Get.textTheme.titleMedium!.copyWith(color: color),
          ),
          _buildCountry(),
        ],
      ),
    );
  }

  /// build the sort by section
  Widget _buildSortBy() {
    return Wrap(
      children: NewsSortBy.values
          .map((e) => SizedBox(
                child: _customChip(
                    onPressed: () {
                      if (_newsSortBy == e) {
                        _newsSortBy = null;
                      } else {
                        _newsSortBy = e;
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    selected: _newsSortBy == e,
                    text: e.enumToString()),
              ))
          .toList(),
    );
  }

  /// custom chip for sort by, language, country items
  Widget _customChip(
      {required bool selected, required String text, VoidCallback? onPressed}) {
    Color? backgroundColor;
    Color? textColor;
    if (selected) {
      backgroundColor = Get.theme.primaryColor;
      textColor = AppThemes.white;
    }
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.r),
        child: GestureDetector(
          onTap: onPressed,
          child: Chip(
            label: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            backgroundColor: backgroundColor,
          ),
        ));
  }

  /// build language list for filtration
  Widget _buildLanguage() {
    return Wrap(
      children: NewsLanguages.values
          .map((e) => e == NewsLanguages.none
              ? const SizedBox.shrink()
              : SizedBox(
                  child: _customChip(
                      onPressed: () {
                        if (_newsLanguage == e) {
                          _newsLanguage = null;
                        } else {
                          _newsLanguage = e;
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      selected: _newsLanguage == e,
                      text: e.enumToString()),
                ))
          .toList(),
    );
  }

  /// Build the country list for filtration
  Widget _buildCountry() {
    return Wrap(
      children: NewsCountry.values
          .map((e) => e == NewsCountry.none
              ? const SizedBox.shrink()
              : SizedBox(
                  child: _customChip(
                      onPressed: () {
                        if (_newsCountry == e) {
                          _newsCountry = null;
                        } else {
                          _newsCountry = e;
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      selected: _newsCountry == e,
                      text: e.enumToString()),
                ))
          .toList(),
    );
  }

  /// reset all filters
  void _reset() {
    _newsSortBy = null;
    _newsLanguage = null;
    _newsCountry = null;
    if (mounted) {
      setState(() {});
    }
  }
}
