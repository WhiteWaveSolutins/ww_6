import 'package:drift/drift.dart';

class FolderTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  BoolColumn get havePassword => boolean()();

  IntColumn get image => integer()();
}
