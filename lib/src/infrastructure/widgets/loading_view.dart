import 'package:doit/src/infrastructure/utils/constant/lottie_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(LottieAssets.loading, height: 100),
    );
  }
}
