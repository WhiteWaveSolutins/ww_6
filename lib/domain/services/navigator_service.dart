import 'package:flutter/cupertino.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
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

  void onGetPremium() => navigatorKey.currentState!.pushNamed(AppRoutes.getPremium);

  void onSaveDocument({required String image}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.saveDocument,
      arguments: AppRouterArguments(image: image),
    );
  }

  void onFolder({required Folder folder}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.folder,
      arguments: AppRouterArguments(folder: folder),
    );
  }

  void onSuccessfullyDocument({required Document document}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.successfullyDocument,
      arguments: AppRouterArguments(document: document),
    );
  }
}
