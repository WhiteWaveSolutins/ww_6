import 'package:drift/drift.dart';

class DocumentPathTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get documentId => integer()();

  TextColumn get path => text()();
}
