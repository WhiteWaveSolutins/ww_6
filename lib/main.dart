import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scan_doc/domain/di/locator.dart';
import 'package:scan_doc/route.dart';
import 'package:scan_doc/ui/resurses/theme.dart';
import 'package:scan_doc/ui/screens/splash/splash_screen.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:talker/talker.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'domain/di/get_it_services.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);
  HttpOverrides.global = MyHttpOverrides();
  final locator = LocatorService();
  await locator.configService.init();
  locator.init();
  addLifecycleHandler();

  FlutterError.onError = (details) {
    Talker().logCustom(
      TalkerLog(
        details.exceptionAsString(),
        title: 'ERROR FLUTTER',
        logLevel: LogLevel.critical,
        stackTrace: details.stack,
      ),
    );
  };

  runApp(QrCodeScannerReaderScan(locator: locator));
}

class QrCodeScannerReaderScan extends StatelessWidget {
  final LocatorService locator;

  const QrCodeScannerReaderScan({
    super.key,
    required this.locator,
  });

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: StoreProvider<AppState>(
        store: locator.store,
        child: MaterialApp(
          navigatorKey: locator.navigatorKey,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          title: 'Qr code scanner - reader scan',
          theme: lightThemeData,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}

void addLifecycleHandler() {
  WidgetsBinding.instance.addObserver(
    AppLifecycleListener(
      onDetach: getItService.configService.closeClient,
    ),
  );
}
