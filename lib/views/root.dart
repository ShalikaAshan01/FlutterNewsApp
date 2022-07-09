import 'package:flutter/material.dart';
import 'package:news_app/views/authentication/register_view.dart';

/// This class will navigate the user to login screen or dashboard screen
class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return RegisterView();
  }
}
