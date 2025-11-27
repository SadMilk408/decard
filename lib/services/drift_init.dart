import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:english_training_app/features/dictionaries/data/tables/dictionaries_table.dart';
import 'package:english_training_app/features/trainings/data/tables/word_progress.dart';
import 'package:english_training_app/features/words/data/tables/words_table.dart';

part 'drift_init.g.dart';

@DriftDatabase(tables: [DictionariesDto, WordsDto, WordProgressDto])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        // databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (openingDetails) async {},
    );
  }

  /// Очищает все данные из всех таблиц БД
  Future<void> clearAllTables() async {
    // Удаляем все данные из всех таблиц
    await delete(wordProgressDto).go();
    await delete(wordsDto).go();
    await delete(dictionariesDto).go();
  }

  /// Полностью удаляет БД и пересоздаёт её заново
  Future<void> deleteDatabase() async {
    final migrator = Migrator(this);
    // Удаляем все таблицы
    for (final table in allTables) {
      await migrator.deleteTable(table.actualTableName);
    }
    // Пересоздаём все таблицы
    await migrator.createAll();
  }
}
