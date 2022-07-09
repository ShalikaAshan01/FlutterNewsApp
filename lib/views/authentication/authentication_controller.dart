import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/authentication_manager.dart';
import 'package:news_app/views/dashboard/dashboard_view.dart';

class AuthenticationController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  final AuthenticationManager authenticationManager = AuthenticationManager.to;

  Future<void> onRegister() async {
    if (registerFormKey.currentState!.validate()) {
      final res = await authenticationManager.saveUserData(
          emailController.text, passwordController.text);
      if (res) {
        Get.offAndToNamed(DashboardView.routeName);
      }
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
    }
  }
}
