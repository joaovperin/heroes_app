import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heroes_app/application/config/app_env.dart';
import 'package:heroes_app/application/config/app_routes.dart';
import 'package:window_size/window_size.dart' as libWindowSize;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppEnv().init();
  HttpOverrides.global = MyHttpOverrides();

  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      libWindowSize.setWindowTitle('Heroes App');
      libWindowSize.setWindowMinSize(const Size(320, 480));
      libWindowSize.setWindowMaxSize(Size.infinite);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes().initialRoute,
      routes: AppRoutes().routes,
    );
  }
}
