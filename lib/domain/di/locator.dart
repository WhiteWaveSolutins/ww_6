import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:scan_doc/data/database/database.dart';
import 'package:scan_doc/data/repositories/local_document_repository.dart';
import 'package:scan_doc/data/repositories/local_folder_repository.dart';
import 'package:scan_doc/data/services/config_service.dart';
import 'package:scan_doc/domain/repositories/document_repository.dart';
import 'package:scan_doc/domain/repositories/folder_repository.dart';
import 'package:scan_doc/domain/services/navigator_service.dart';
import 'package:scan_doc/domain/use_cases/document_use_case.dart';
import 'package:scan_doc/domain/use_cases/folder_use_case.dart';
import 'package:scan_doc/ui/state_manager/document/middleware.dart';
import 'package:scan_doc/ui/state_manager/document/state.dart';
import 'package:scan_doc/ui/state_manager/folder/middleware.dart';
import 'package:scan_doc/ui/state_manager/folder/state.dart';
import 'package:scan_doc/ui/state_manager/reduser.dart';
import 'package:scan_doc/ui/state_manager/store.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final database = AppDataBase();

  late NavigatorService navigatorService;

  late FolderRepository folderRepository;
  late DocumentRepository documentRepository;

  late FolderUseCase folderUseCase;
  late DocumentUseCase documentUseCase;

  late Store<AppState> store;
  final configService = ConfigService();

  init() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);

    folderRepository = LocalFolderRepository(database: database);
    documentRepository = LocalDocumentRepository(database: database);

    store = Store(
      appReducer,
      initialState: AppState(
        folderListState: FolderListState(),
        documentListState: DocumentListState(),
      ),
      middleware: [
        FolderMiddleware(folderRepository: folderRepository).call,
        DocumentMiddleware(documentRepository: documentRepository).call,
      ],
    );

    folderUseCase = FolderUseCase(
      folderRepository: folderRepository,
      store: store,
    );

    documentUseCase = DocumentUseCase(
      documentRepository: documentRepository,
      store: store,
    );

    _register();
  }

  void _register() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
    GetIt.I.registerSingleton<ConfigService>(configService);
    GetIt.I.registerSingleton<FolderUseCase>(folderUseCase);
    GetIt.I.registerSingleton<DocumentUseCase>(documentUseCase);
  }
}
