import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app/models/news_response.dart';

class NewsDetailsController extends GetxController {
  final Rx<Articles> article = Articles().obs;

  @override
  void onInit() {
    convertToDecode();
    super.onInit();
  }

  convertToDecode() {
    final String? json = Get.parameters['article'];
    if (json != null && json.isNotEmpty) {
      final decode = jsonDecode(json);
      final passToModel = Articles.fromJson(decode);
      // NewsDetailsView(passToModel);
    }
  }
}
