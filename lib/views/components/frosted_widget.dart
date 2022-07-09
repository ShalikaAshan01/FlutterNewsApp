import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/common.dart';

class FrostedWidget extends StatelessWidget {
  const FrostedWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppBorderRadius.cardRadius.r),
                color: Colors.grey.shade200.withOpacity(0.5)),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
