import 'package:doit/src/infrastructure/utils/constant/lottie_assets.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            LottieAssets.empty,
            width: 250.w,
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(Strings.taskEmptyMessage)
        ],
      ),
    );
  }
}
