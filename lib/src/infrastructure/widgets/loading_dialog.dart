import 'package:doit/src/infrastructure/widgets/loading_view.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  const LoadingDialog();

  static Future<void> openDialog(BuildContext context,
      {bool isRootNavigator = false}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: isRootNavigator,
      builder: (context) => const _LoadingDialog(),
    );
  }

  static Future<void> close(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
    return;
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        child: LoadingView(),
      ),
    );
  }
}
