import 'package:drift/drift.dart';

import 'dictionaries_table.dart';

class WordsDto extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mainWord => text()();
  TextColumn get translate => text()();
  TextColumn get example => text().nullable()();
  TextColumn get translationExample => text().nullable()();
  TextColumn get definition => text().nullable()();
  TextColumn get translationDefinition => text().nullable()();

  // ID словаря, к которому принадлежит слово
  IntColumn get dictionaryId => integer().references(DictionariesDto, #id)();
}
