
import 'package:get/route_manager.dart';
import 'package:news_app/views/dashboard/dashboard_view.dart';

import '../views/root.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final List<GetPage> routes = [
    GetPage(name: Root.routeName, page: () => const Root()),
    GetPage(name: DashboardView.routeName, page: () => DashboardView()),
  ];
}