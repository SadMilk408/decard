import 'package:drift/drift.dart';

class DictionariesDto extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}
