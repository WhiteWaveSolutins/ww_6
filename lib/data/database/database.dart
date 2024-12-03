import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart' as drift;
import 'package:scan_doc/data/database/tables/document_path_table.dart';
import 'package:scan_doc/data/database/tables/document_table.dart';
import 'package:scan_doc/data/database/tables/folder_document_table.dart';
import 'package:scan_doc/data/database/tables/folder_table.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:talker/talker.dart';

part 'database.g.dart';

void _log(String message) {
  Talker().logCustom(
    TalkerLog(
      message,
      title: 'DATABASE',
      logLevel: LogLevel.info,
    ),
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database3'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    FolderTable,
    DocumentPathTable,
    FolderDocumentTable,
    DocumentTable,
  ],
)
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  //Folders
  Future<List<Folder>?> getListFolder() async {
    try {
      final list = await select(folderTable).get();
      _log('Get Folders');
      return list.map((e) => Folder.fromTableData(e)).toList();
    } catch (_) {
      _log('Error Get Folders');
      return null;
    }
  }

  Future<Folder?> addFolder({
    required String name,
    required int image,
    required bool havePassword,
  }) async {
    try {
      final companion = FolderTableCompanion(
        name: drift.Value(name),
        image: drift.Value(image),
        havePassword: drift.Value(havePassword),
      );
      final id = await into(folderTable).insert(companion);
      _log('Add Folder $name');
      final folder = await (select(folderTable)..where((tbl) => tbl.id.isIn([id]))).getSingle();
      return Folder.fromTableData(folder);
    } catch (_) {
      _log('Error Add Folder $name');
      return null;
    }
  }

  Future<Folder?> editFolder({
    required String name,
    required int image,
    required bool havePassword,
    required int folderId,
  }) async {
    try {
      final companion = FolderTableCompanion(
        name: drift.Value(name),
        image: drift.Value(image),
        havePassword: drift.Value(havePassword),
      );
      await (update(folderTable)..where((tbl) => tbl.id.isIn([folderId]))).write(companion);
      _log('Edit Folder $name');
      return Folder(
        imageIndex: image,
        name: name,
        havePassword: havePassword,
        id: folderId,
      );
    } catch (e) {
      _log('Error Edit Folder $name');
      _log(e.toString());
      return null;
    }
  }

  Future<bool> deleteFolder({required int folderId}) async {
    try {
      await (delete(folderTable)..where((t) => t.id.isIn([folderId]))).go();
      await (delete(folderDocumentTable)..where((t) => t.folderId.isIn([folderId]))).go();
      _log('Delete Folder $folderId');
      return true;
    } catch (_) {
      _log('Error Delete Folder $folderId');
      return false;
    }
  }

  //Document
  Future<List<Document>?> getListDocument() async {
    try {
      final documents = await select(documentTable).get();
      final List<Document> models = [];
      for (var document in documents) {
        final paths = await (select(documentPathTable)
              ..where((tbl) => tbl.documentId.isIn([document.id])))
            .get();
        final folders = await (select(folderDocumentTable)
              ..where((tbl) => tbl.documentId.isIn([document.id])))
            .get();
        models.add(Document.fromTableData(
          data: document,
          paths: paths,
          folders: folders,
        ));
      }
      _log('Get Documents');
      return models;
    } catch (_) {
      _log('Error Get Documents');
      return null;
    }
  }

  Future<Document?> getDocument({required int documentId}) async {
    try {
      final document =
          await (select(documentTable)..where((tbl) => tbl.id.isIn([documentId]))).getSingle();
      final paths = await (select(documentPathTable)
            ..where((tbl) => tbl.documentId.isIn([documentId])))
          .get();
      final folders = await (select(folderDocumentTable)
            ..where((tbl) => tbl.documentId.isIn([documentId])))
          .get();
      _log('Get Document $documentId');
      return Document.fromTableData(
        data: document,
        paths: paths,
        folders: folders,
      );
    } catch (_) {
      _log('Error Get Document $documentId');
      return null;
    }
  }

  Future<Document?> addDocument({
    required String name,
    required List<String> paths,
  }) async {
    try {
      final documentCompanion = DocumentTableCompanion(
        name: drift.Value(name),
        created: drift.Value(DateTime.now()),
      );
      final id = await into(documentTable).insert(documentCompanion);
      for (var path in paths) {
        final pathCompanion = DocumentPathTableCompanion(
          documentId: drift.Value(id),
          path: drift.Value(path),
        );
        await into(documentPathTable).insert(pathCompanion);
      }
      _log('Add document $name');

      return getDocument(documentId: id);
    } catch (_) {
      _log('Error Add document $name');
      return null;
    }
  }

  Future<bool> editDocument({
    required int documentId,
    required String name,
    required List<String> paths,
  }) async {
    try {
      final companion = DocumentTableCompanion(
        name: drift.Value(name),
        created: drift.Value(DateTime.now()),
      );
      await (update(documentTable)..where((tbl) => tbl.id.isIn([documentId]))).write(companion);
      await (delete(documentPathTable)..where((t) => t.documentId.isIn([documentId]))).go();
      for (var path in paths) {
        final pathCompanion = DocumentPathTableCompanion(
          documentId: drift.Value(documentId),
          path: drift.Value(path),
        );
        await into(documentPathTable).insert(pathCompanion);
      }
      _log('Edit document $name');
      return true;
    } catch (_) {
      _log('Error Edit document $name');
      return false;
    }
  }

  Future<bool> moveDocument({
    required int documentId,
    required List<int> folderIds,
  }) async {
    try {
      final rows =
          await (select(folderDocumentTable)..where((t) => t.documentId.isIn([documentId]))).get();
      final folderRowIds = rows.map((e) => e.folderId).toList();

      final deletingIds =
          folderRowIds.where((e) => folderIds.isEmpty ? true : !folderIds.contains(e)).toList();

      for (var folderId in deletingIds) {
        await deleteFolderDocument(
          folderId: folderId,
          documentId: documentId,
        );
      }

      for (var folderId in folderIds) {
        if (!folderRowIds.contains(folderId)) {
          final companion = FolderDocumentTableCompanion(
            documentId: drift.Value(documentId),
            folderId: drift.Value(folderId),
          );
          await into(folderDocumentTable).insert(companion);
          _log('Move document $documentId in $folderId');
        }
      }

      return true;
    } catch (_) {
      _log('Move document $documentId');
      return false;
    }
  }

  Future<bool> deleteFolderDocument({
    required int documentId,
    required int folderId,
  }) async {
    try {
      await (delete(folderDocumentTable)
            ..where((t) => t.documentId.isIn([documentId]))
            ..where((t) => t.folderId.isIn([folderId])))
          .go();
      _log('Delete Document Folder $documentId/$folderId');
      return true;
    } catch (_) {
      _log('Error Delete Document Folder $documentId/$folderId');
      return false;
    }
  }

  Future<bool> deleteDocument({required int documentId}) async {
    try {
      await (delete(documentTable)..where((t) => t.id.isIn([documentId]))).go();
      await (delete(documentPathTable)..where((t) => t.documentId.isIn([documentId]))).go();
      await (delete(folderDocumentTable)..where((t) => t.documentId.isIn([documentId]))).go();
      _log('Delete Document $documentId');
      return true;
    } catch (_) {
      _log('Error Delete Document $documentId');
      return false;
    }
  }
}
