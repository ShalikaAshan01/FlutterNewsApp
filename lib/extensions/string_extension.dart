import 'package:intl/intl.dart';
import 'package:news_app/models/news_category.dart';

extension StringExtension on String {
  double parseDouble() =>
      double.tryParse(this) ?? int.tryParse(this)?.toDouble() ?? 0;

  int parseInt() => int.tryParse(this) ?? 0;

  DateTime parseDateTime() {
    if (isEmpty) {
      return DateTime.now();
    }
    return DateFormat('yyyy-MM-ddTHH:mm:ss').parse(this);
  }

  String enumToString() => split('.')[1];

  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  NewsCategory? getCategory() {
    switch (this) {
      case 'health':
        return NewsCategory.health;
      case 'technology':
        return NewsCategory.technology;
      case 'business':
        return NewsCategory.business;
      case 'entertainment':
        return NewsCategory.entertainment;
      case 'general':
        return NewsCategory.general;
      case 'science':
        return NewsCategory.science;
      case 'sports':
        return NewsCategory.sports;
      default:
        return null;
    }
  }
}
