import 'package:flutter/cupertino.dart';
import 'package:scan_doc/route.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService({required this.navigatorKey});

  void onPop() => navigatorKey.currentState!.pop();

  bool canPop() => navigatorKey.currentState!.canPop();

  void onFirst() => navigatorKey.currentState!.popUntil((route) => route.isFirst);

  void onMain() => navigatorKey.currentState!.pushNamedAndRemoveUntil(
        AppRoutes.main,
        (Route<dynamic> route) => false,
      );
}
