import 'package:flutter/widgets.dart';
import 'package:heroes_app/application/ui/app_home_page.dart';

/// Maps all app routes
class AppRoutes {
  static const AppRoutes _instance = AppRoutes._();
  const AppRoutes._();
  factory AppRoutes() => _instance;

  /// Returns app initialRoute
  String get initialRoute => MyHomePage.pageRoute;

  /// Returns all [AppRoute] routes, after wrapping their respective guards, in a [Map]
  Map<String, WidgetBuilder> get routes => {
        MyHomePage.pageRoute: (context) => const MyHomePage(),
      };
}
