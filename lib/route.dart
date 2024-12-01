import 'package:flutter/material.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/ui/screens/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:scan_doc/ui/screens/folder/folder_screen.dart';
import 'package:scan_doc/ui/screens/get_premium/get_premium_screen.dart';
import 'package:scan_doc/ui/screens/save_document/save_document_screen.dart';
import 'package:scan_doc/ui/screens/successfully_add_document/successfully_add_document_screen.dart';

class AppRoutes {
  static const main = '/main';
  static const folder = '/folder';
  static const getPremium = '/get-premium';
  static const saveDocument = '/save-document';
  static const successfullyDocument = '/successfully-document';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      AppRoutes.main: (BuildContext context) => const BottomTabBar(),
      AppRoutes.saveDocument: (BuildContext context) => SaveDocumentScreen(image: arg!.image!),
      AppRoutes.folder: (BuildContext context) => FolderScreen(folder: arg!.folder!),
      AppRoutes.successfullyDocument: (BuildContext context) => SuccessfullyAddDocumentScreen(
            document: arg!.document!,
          ),
      AppRoutes.getPremium: (BuildContext context) => const GetPremiumScreen(),
    };

    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}

class AppRouterArguments {
  final String? image;
  final Document? document;
  final Folder? folder;

  AppRouterArguments({
    this.image,
    this.document,
    this.folder,
  });
}
