import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/constants/app_routes.dart';
import 'package:news_app/models/app_config.dart';

import 'constants/app_themes.dart';
import 'utils/authentication_manager.dart';

Future<Widget> initializeApp(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _registerGetX();
  return MyApp(
    appConfig: config,
  );
}

// register all getx controllers
void _registerGetX() {
  Get.put<AuthenticationManager>(AuthenticationManager());
  // Get.put<LoginController>(LoginController());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appConfig}) : super(key: key);
  final AppConfig appConfig;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: appConfig.appName,
          debugShowCheckedModeBanner: appConfig.flavor == 'dev',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: "/",
          builder: EasyLoading.init(),
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}