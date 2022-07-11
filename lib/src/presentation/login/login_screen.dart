import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/navigation/routes.gr.dart';
import 'package:doit/src/infrastructure/navigation/session_guard.dart';
import 'package:doit/src/infrastructure/utils/constant/lottie_assets.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:doit/src/infrastructure/widgets/loading_dialog.dart';
import 'package:doit/src/infrastructure/widgets/login_social_media_button.dart';
import 'package:doit/src/presentation/login/login_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './_login_button_view.dart';
part './_onboard_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = AdaptiveRoute(
      path: '/login-screen',
      page: LoginScreen,
      initial: true,
      guards: [SessionGuard]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state.loginProcess == LoginProcess.success) {
              LoadingDialog.close(context);
              AutoRouter.of(context).replace(const DashboardScreenRoute());
            } else if (state.loginProcess == LoginProcess.loading) {
              LoadingDialog.openDialog(context);
            } else if (state.loginProcess == LoginProcess.failed) {
              LoadingDialog.close(context);
            }
          },
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox.shrink(),
                Padding(padding: EdgeInsets.all(16.0), child: _OnBoardView()),
                Padding(
                    padding: EdgeInsets.all(16.0), child: _LoginButtonView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
