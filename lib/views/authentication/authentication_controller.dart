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
  final RxBool error = false.obs;

  Future<void> onRegister() async {
    if (registerFormKey.currentState!.validate()) {
      final res = await authenticationManager.saveUserData(
          emailController.text, passwordController.text);
      if (res) {
        Get.offAll(() => DashboardView());
      }
    }
  }

  Future<void> onLogin() async {
    String? email = authenticationManager.getEmail();
    String? password = authenticationManager.getPassword();
    if (emailController.text == email && passwordController.text == password) {
      authenticationManager.changeLoginStatus(true);
      Get.offAll(() => DashboardView());
    } else {
      error.value = true;
    }
  }
}
