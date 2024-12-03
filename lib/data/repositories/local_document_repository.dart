import 'package:scan_doc/data/database/database.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/domain/repositories/document_repository.dart';

class LocalDocumentRepository implements DocumentRepository {
  final AppDataBase database;

  LocalDocumentRepository({required this.database});

  @override
  Future<List<Document>?> getListDocument() => database.getListDocument();

  @override
  Future<Document?> addDocument({
    required String name,
    required List<String> paths,
  }) {
    return database.addDocument(
      name: name,
      paths: paths,
    );
  }

  @override
  Future<bool> editDocument({
    required String name,
    required List<String> paths,
    required int id,
  }) {
    return database.editDocument(
      name: name,
      paths: paths,
      documentId: id,
    );
  }

  @override
  Future<bool> deleteDocument({required int documentId}) =>
      database.deleteDocument(documentId: documentId);

  @override
  Future<bool> moveDocument({
    required int documentId,
    required List<int> folderIds,
  }) {
    return database.moveDocument(
      documentId: documentId,
      folderIds: folderIds,
    );
  }

  @override
  Future<bool> deleteFolderDocument({
    required int documentId,
    required int folderId,
  }) {
    return database.deleteFolderDocument(
      documentId: documentId,
      folderId: folderId,
    );
  }
}
