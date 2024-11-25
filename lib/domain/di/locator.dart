import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:scan_doc/data/services/config_service.dart';
import 'package:scan_doc/domain/services/navigator_service.dart';
import 'package:scan_doc/ui/state_manager/reduser.dart';
import 'package:scan_doc/ui/state_manager/store.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();

  late NavigatorService navigatorService;

  late Store<AppState> store;
  final configService = ConfigService();

  init() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);

    store = Store(
      appReducer,
      initialState: AppState(),
      middleware: [],
    );

    _register();
  }

  void _register() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
    GetIt.I.registerSingleton<ConfigService>(configService);
  }
}
