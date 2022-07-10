import 'package:flutter/material.dart';

import 'main.dart';
import 'models/app_config.dart';

void main() async {
  AppConfig devAppConfig = AppConfig(appName: 'News App Dev', flavor: 'dev');
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}
