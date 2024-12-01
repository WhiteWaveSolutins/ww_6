import 'package:redux/redux.dart';
import 'package:scan_doc/domain/repositories/folder_repository.dart';
import 'package:scan_doc/ui/state_manager/folder/action.dart';
import 'package:scan_doc/ui/state_manager/store.dart';

class FolderMiddleware implements MiddlewareClass<AppState> {
  final FolderRepository folderRepository;

  FolderMiddleware({required this.folderRepository});

  @override
  call(store, action, next) {
    // Folders
    if (action is LoadFolderListAction) {
      Future(() async {
        final folders = await folderRepository.getListFolder();
        if (folders == null) {
          store.dispatch(ErrorFolderListAction(message: 'Failed to get folders'));
        } else {
          store.dispatch(ShowFolderListAction(folders: folders));
        }
      });
    }

    next(action);
  }
}
