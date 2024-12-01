import 'package:get_it/get_it.dart';
import 'package:scan_doc/data/services/config_service.dart';
import 'package:scan_doc/domain/services/navigator_service.dart';
import 'package:scan_doc/domain/use_cases/document_use_case.dart';
import 'package:scan_doc/domain/use_cases/folder_use_case.dart';

class GetItServices {
  NavigatorService get navigatorService => GetIt.I.get<NavigatorService>();

  ConfigService get configService => GetIt.I.get<ConfigService>();

  FolderUseCase get folderUseCase => GetIt.I.get<FolderUseCase>();

  DocumentUseCase get documentUseCase => GetIt.I.get<DocumentUseCase>();
}

final getItService = GetItServices();
