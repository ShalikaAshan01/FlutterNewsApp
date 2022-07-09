import 'package:news_app/extensions/string_extension.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/models/news_country.dart';
import 'package:news_app/models/news_languages.dart';
import 'package:news_app/models/news_sort_by.dart';
import 'package:news_app/utils/api_client.dart';

import '../models/news_response.dart';

class NewsServices {
  Future<NewsResponse?> getTopHeadline(
      {NewsCategory? category,
      int page = 1,
      String? text,
      NewsSortBy? sortBy,
      NewsLanguages? language,
      NewsCountry? country}) async {
    Map<String, dynamic> queryParams = {};
    if (category != null) {
      queryParams['category'] = category.toString().enumToString();
    }
    queryParams['country'] = 'us';
    queryParams['page'] = page.toString();
    if (text != null) {
      queryParams['q'] = text;
    }
    if (sortBy != null) {
      queryParams['sortBy'] = sortBy.toString().enumToString();
    }
    if (language != null && language != NewsLanguages.none) {
      queryParams['language'] = language.toString().enumToString();
    }
    if (country != null && country != NewsCountry.none) {
      queryParams['country'] = country.toString().enumToString();
    }
    var res = await ApiClient.call('/top-headlines', ApiMethod.get,
        queryParams: queryParams);
    if (res?.data == null) {
      return null;
    } else {
      return NewsResponse.fromJson(res?.data);
    }
  }

  Future<NewsResponse?> getEverything({int page = 1}) async {
    Map<String, dynamic> queryParams = {};

    queryParams['country'] = 'us';
    queryParams['language'] = 'en';
    queryParams['page'] = page.toString();
    var res = await ApiClient.call('/top-headlines', ApiMethod.get,
        queryParams: queryParams);
    if (res?.data == null) {
      return null;
    } else {
      return NewsResponse.fromJson(res?.data);
    }
  }
}
