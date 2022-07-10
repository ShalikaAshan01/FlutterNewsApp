import 'package:flutter/material.dart';

import 'main.dart';
import 'models/app_config.dart';

void main() async {
  AppConfig appConfig = AppConfig(appName: 'News App Prod', flavor: 'prod');
  Widget app = await initializeApp(appConfig);
  runApp(app);
}
