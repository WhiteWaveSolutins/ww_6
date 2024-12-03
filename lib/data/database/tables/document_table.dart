import 'package:drift/drift.dart';

class DocumentTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  DateTimeColumn get created => dateTime()();
}
