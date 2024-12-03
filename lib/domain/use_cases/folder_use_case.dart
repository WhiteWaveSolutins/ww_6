import 'package:redux/redux.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/domain/repositories/folder_repository.dart';
import 'package:scan_doc/ui/state_manager/document/action.dart';
import 'package:scan_doc/ui/state_manager/folder/action.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/toast/app_toast.dart';

class FolderUseCase {
  final FolderRepository folderRepository;
  final Store<AppState> store;

  FolderUseCase({
    required this.folderRepository,
    required this.store,
  });

  Future<Folder?> addFolder({
    required String name,
    required int image,
    required bool havePassword,
  }) async {
    final newFolder = await folderRepository.addFolder(
      name: name,
      image: image,
      havePassword: havePassword,
    );
    if (newFolder == null) {
      showAppToast('Failed to add folder');
    } else {
      store.dispatch(AddFolderListAction(folder: newFolder));
    }
    return newFolder;
  }

  Future<Folder?> editFolder({
    required String name,
    required int image,
    required bool havePassword,
    required int folderId,
  }) async {
    final newFolder = await folderRepository.editFolder(
      name: name,
      image: image,
      havePassword: havePassword,
      folderId: folderId,
    );
    if (newFolder == null) {
      showAppToast('Failed to edit folder');
    } else {
      store.dispatch(LoadFolderListAction());
    }
    return newFolder;
  }

  Future<bool> deleteFolder({required int folderId}) async {
    final status = await folderRepository.deleteFolder(folderId: folderId);
    store.dispatch(LoadFolderListAction());
    store.dispatch(LoadDocumentListAction());
    return status;
  }
}
