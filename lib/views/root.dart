import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/authentication_manager.dart';
import 'package:news_app/views/authentication/login_view.dart';
import 'package:news_app/views/dashboard/dashboard_view.dart';

/// This class will navigate the user to login screen or dashboard screen
class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  static const String routeName = '/';
  AuthenticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Obx(() =>
              _authManager.isLogged.value ? DashboardView() : LoginView());
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Future<bool> _initializeData() async {
    return _authManager.checkLoginStatus();
  }
}
