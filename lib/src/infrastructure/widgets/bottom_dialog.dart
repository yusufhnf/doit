import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/utils/constant/lottie_assets.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BottomDialog {
  const BottomDialog();

  static Future<void> showInformation(
      {required BuildContext context,
      bool? isSuccess,
      required String description}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                isSuccess == null
                    ? LottieAssets.info
                    : isSuccess == true
                        ? LottieAssets.success
                        : LottieAssets.failed,
                width: 150.w,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                isSuccess == null
                    ? Strings.infoLabel
                    : isSuccess == true
                        ? Strings.successLabel
                        : Strings.failedLabel,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => AutoRouter.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text("OK")))
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
    );
  }
}
