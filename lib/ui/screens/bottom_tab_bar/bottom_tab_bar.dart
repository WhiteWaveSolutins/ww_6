import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/screens/main/main_screen.dart';
import 'package:scan_doc/ui/screens/settings/settings_screen.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:flutter_open_app_settings/flutter_open_app_settings.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

final catalogNavKey = GlobalKey<NavigatorState>();
final basketNavKey = GlobalKey<NavigatorState>();
final favoriteNavKey = GlobalKey<NavigatorState>();
final profileNavKey = GlobalKey<NavigatorState>();

class _BottomTabBarState extends State<BottomTabBar> {
  int _currentIndex = 0;

  void goToTab(int index) async {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IndexedStack(
          index: _currentIndex,
          children: [
            const MainScreen(),
            Container(),
            const SettingsScreen(),
          ],
        ),
        BottomBarWidget(
          page: _currentIndex,
          goTo: goToTab,
        ),
      ],
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  final int page;
  final Function(int) goTo;

  const BottomBarWidget({
    super.key,
    required this.goTo,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.only(
              bottom: 15,
              top: 5,
              right: 30,
              left: 30,
            ),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                  child: SvgIcon(
                    icon: AppIcons.file,
                    size: 25,
                    color: page == 0 ? Colors.white : AppColors.grey,
                  ),
                  onPressed: () {
                    Gaimon.selection();
                    goTo(0);
                  },
                ),
                const SizedBox(),
                CupertinoButton(
                  onPressed: () {
                    Gaimon.selection();
                    goTo(2);
                  },
                  child: SvgIcon(
                    icon: AppIcons.settings,
                    size: 25,
                    color: page == 2 ? Colors.white : AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          const _Scanner(),
        ],
      ),
    );
  }
}

class _Scanner extends StatefulWidget {
  const _Scanner({super.key});

  @override
  State<_Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<_Scanner> {
  Future<bool> _getPermission() async {
    try {
      var status = await Permission.camera.status;
      if (status.isDenied || status.isPermanentlyDenied) {
        final newStatus = await Permission.camera.request();
        if (newStatus.isDenied || status.isPermanentlyDenied) return false;
      }

      if (Platform.isIOS) {
        var statusPhotos = await Permission.photos.request();
        if (statusPhotos.isDenied || status.isPermanentlyDenied) {
          final newStatusPhotos = await Permission.photos.request();
          if (newStatusPhotos.isDenied || status.isPermanentlyDenied) return false;
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  void _scanner() async {
    final status = await _getPermission();
    if (!status && Platform.isIOS) {
      FlutterOpenAppSettings.openAppsSettings(
        settingsCode: SettingsCode.APP_SETTINGS,
        onCompletion: () {},
      );
      return;
    }

    Gaimon.selection();
    final image = await CunningDocumentScanner.getPictures(
      noOfPages: 1,
      isGalleryImportAllowed: true,
    );
    if ((image ?? []).isNotEmpty) {
      getItService.navigatorService.onSaveDocument(image: image!.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: _scanner,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              AppColors.primaryGrad1,
              AppColors.primaryGrad2,
            ],
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: const SvgIcon(
          icon: AppIcons.scan,
          size: 50,
        ),
      ),
    );
  }
}
