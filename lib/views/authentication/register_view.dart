import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/views/authentication/authentication_controller.dart';

import '../../constants/common.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(
              horizontal: Insets.horizontalScreenPadding.r),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _authenticationController.registerFormKey,
        child: Column(children: <Widget>[
          SizedBox(height: Insets.verticalBetweenPadding.r),
          FlutterLogo(
            size: 100.h,
          ),
          Text(
            'News App',
            style: Get.textTheme.headlineMedium
                ?.copyWith(color: Get.theme.primaryColor),
          ),
          SizedBox(height: Insets.verticalBetweenPadding.r),
          TextFormField(
            controller: _authenticationController.emailController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              String email = value ?? '';
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email);
              if (!emailValid) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              labelText: 'Email',
            ),
          ),
          SizedBox(height: Insets.verticalBetweenPadding.r),
          TextFormField(
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.length < 8) {
                return 'Please enter at least 8 characters';
              }
              return null;
            },
            obscureText: true,
            controller: _authenticationController.passwordController,
            decoration: const InputDecoration(
              hintText: 'Enter your Password',
              labelText: 'Password',
            ),
          ),
          SizedBox(height: Insets.verticalBetweenPadding.r),
          TextFormField(
            obscureText: true,
            textInputAction: TextInputAction.done,
            onEditingComplete: _authenticationController.onRegister,
            controller: _authenticationController.confirmPasswordController,
            validator: (val) {
              if (val != _authenticationController.passwordController.text) {
                return 'Password does not match';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Re-enter your Password',
              labelText: 'Confirm Password',
            ),
          ),
          SizedBox(height: Insets.verticalBetweenPadding.r),
          SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                  onPressed: _authenticationController.onRegister,
                  child: Text('Register')))
        ]),
      ),
    );
  }
}
