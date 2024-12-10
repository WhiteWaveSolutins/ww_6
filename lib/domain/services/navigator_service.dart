import 'package:flutter/cupertino.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/route.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService({required this.navigatorKey});

  dynamic onPop({bool? status}) => navigatorKey.currentState!.pop(status);

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

  Future<dynamic> onInfoPassword({required Function() onOpen}) {
    return navigatorKey.currentState!.pushNamed(
      AppRoutes.infoPassword,
      arguments: AppRouterArguments(function: onOpen),
    );
  }

  Future<dynamic> onPassword({
    required Function() onOpen,
    String? password,
    String? title,
  }) {
    onPop();
    return navigatorKey.currentState!.pushNamed(
      AppRoutes.password,
      arguments: AppRouterArguments(
        function: onOpen,
        text: password,
        title: title,
      ),
    );
  }

  void onSettingPassword() {
    onPop();
    navigatorKey.currentState!.pushNamed(AppRoutes.settingPassword);
  }

  void onSuccessfullyDocument({required Document document}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.successfullyDocument,
      arguments: AppRouterArguments(document: document),
    );
  }

  Future<dynamic> onCostomizeDocument({required String image}) {
   return navigatorKey.currentState!.pushNamed(
      AppRoutes.costomizeDocument,
      arguments: AppRouterArguments(image: image),
    );
  }

  void onDocument({required Document document}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.document,
      arguments: AppRouterArguments(document: document),
    );
  }
}
