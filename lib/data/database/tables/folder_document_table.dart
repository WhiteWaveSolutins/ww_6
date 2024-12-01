import 'package:drift/drift.dart';

class FolderDocumentTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get documentId => integer()();

  IntColumn get folderId => integer()();
}
