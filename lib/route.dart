import 'package:flutter/material.dart';
import 'package:scan_doc/ui/screens/main/main_screen.dart';

class AppRoutes {
  static const main = '/main';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      AppRoutes.main: (BuildContext context) => const MainScreen(),
    };

    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}

class AppRouterArguments {

}
