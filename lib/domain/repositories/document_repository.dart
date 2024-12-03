import 'package:scan_doc/data/models/document.dart';

abstract class DocumentRepository {
  Future<List<Document>?> getListDocument();

  Future<Document?> addDocument({
    required String name,
    required List<String> paths,
  });

  Future<bool> editDocument({
    required String name,
    required List<String> paths,
    required int id,
  });

  Future<bool> deleteDocument({required int documentId});

  Future<bool> deleteFolderDocument({
    required int documentId,
    required int folderId,
  });

  Future<bool> moveDocument({
    required int documentId,
    required List<int> folderIds,
  });
}
