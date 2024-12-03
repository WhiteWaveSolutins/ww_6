import 'package:scan_doc/data/database/database.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/domain/repositories/folder_repository.dart';

class LocalFolderRepository implements FolderRepository {
  final AppDataBase database;

  LocalFolderRepository({required this.database});

  @override
  Future<List<Folder>?> getListFolder() => database.getListFolder();

  @override
  Future<Folder?> addFolder({
    required String name,
    required int image,
    required bool havePassword,
  }) {
    return database.addFolder(
      name: name,
      image: image,
      havePassword: havePassword,
    );
  }

  @override
  Future<Folder?> editFolder({
    required String name,
    required int image,
    required bool havePassword,
    required int folderId,
  }) {
    return database.editFolder(
      name: name,
      image: image,
      havePassword: havePassword,
      folderId: folderId,
    );
  }

  @override
  Future<bool> deleteFolder({required int folderId}) => database.deleteFolder(folderId: folderId);
}
