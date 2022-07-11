import 'package:doit/src/infrastructure/data/remote/repository/auth_repository.dart';
import 'package:doit/src/infrastructure/navigation/session_guard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/infrastructure/navigation/routes.gr.dart';

void main() async {
  await configureApp();
  runApp(MyApp());
}

late final bool isSignedIn;

Future<void> configureApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  final AuthRepository authRepository = AuthRepository();
  isSignedIn = await authRepository.isSignedIn();
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter(sessionGuard: SessionGuard());
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          title: 'DoIt',
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
              primaryColor: Colors.blue),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        );
      },
    );
  }
}
