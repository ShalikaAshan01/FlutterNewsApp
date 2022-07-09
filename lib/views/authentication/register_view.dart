import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/common.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
    return Column(children: <Widget>[
      TextField(
        decoration: InputDecoration(
          hintText: 'Enter your email',
          labelText: 'Email',
        ),
      ),
    ]);
  }
}
