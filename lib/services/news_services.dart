import 'package:news_app/extensions/string_extension.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/utils/api_client.dart';

import '../models/news_response.dart';

class NewsServices {
  Future<NewsResponse?> getTopHeadline(
      {NewsCategory? category, int page = 1}) async {
    Map<String, dynamic> queryParams = {};
    if (category != null) {
      queryParams['category'] = category.toString().enumToString();
    }
    queryParams['country'] = 'us';
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
