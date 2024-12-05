import 'package:flutter/material.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/ui/screens/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:scan_doc/ui/screens/costomize_document/costomize_document_screen.dart';
import 'package:scan_doc/ui/screens/document/document_screen.dart';
import 'package:scan_doc/ui/screens/folder/folder_screen.dart';
import 'package:scan_doc/ui/screens/get_premium/get_premium_screen.dart';
import 'package:scan_doc/ui/screens/password/info_password_screen.dart';
import 'package:scan_doc/ui/screens/password/password_screen.dart';
import 'package:scan_doc/ui/screens/password/setting_password_screen.dart';
import 'package:scan_doc/ui/screens/save_document/save_document_screen.dart';
import 'package:scan_doc/ui/screens/successfully_add_document/successfully_add_document_screen.dart';

class AppRoutes {
  static const main = '/main';
  static const infoPassword = '/info-password';
  static const settingPassword = '/setting-password';
  static const folder = '/folder';
  static const password = '/password';
  static const getPremium = '/get-premium';
  static const saveDocument = '/save-document';
  static const document = '/document';
  static const costomizeDocument = '/costomize-document';
  static const successfullyDocument = '/successfully-document';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      AppRoutes.main: (BuildContext context) => const BottomTabBar(),
      AppRoutes.infoPassword: (BuildContext context) => InfoPasswordScreen(onOpen: arg!.function!),
      AppRoutes.costomizeDocument: (BuildContext context) => CostomizeDocumentScreen(
            image: arg!.image!,
          ),
      AppRoutes.document: (BuildContext context) => DocumentScreen(document: arg!.document!),
      AppRoutes.password: (BuildContext context) => PasswordScreen(
            onOpen: arg!.function!,
            password: arg.text,
            title: arg.title,
          ),
      AppRoutes.settingPassword: (BuildContext context) => const SettingPasswordScreen(),
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
  final String? text;
  final String? title;
  final Document? document;
  final Folder? folder;
  final Function()? function;

  AppRouterArguments({
    this.image,
    this.document,
    this.title,
    this.text,
    this.folder,
    this.function,
  });
}
