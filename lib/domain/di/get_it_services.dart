import 'package:get_it/get_it.dart';
import 'package:scan_doc/data/services/config_service.dart';
import 'package:scan_doc/domain/services/navigator_service.dart';

class GetItServices {
  NavigatorService get navigatorService => GetIt.I.get<NavigatorService>();

  ConfigService get configService => GetIt.I.get<ConfigService>();
}

final getItService = GetItServices();
