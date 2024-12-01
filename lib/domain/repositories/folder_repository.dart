import 'package:scan_doc/data/models/folder.dart';

abstract class FolderRepository {
  Future<List<Folder>?> getListFolder();

  Future<Folder?> addFolder({
    required String name,
    required int image,
    required bool havePassword,
  });

  Future<bool> deleteFolder({required int folderId});
}
