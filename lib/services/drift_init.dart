import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:english_training_app/features/dictionaries/data/tables/dictionaries_table.dart';
import 'package:english_training_app/features/dictionaries/data/tables/words_table.dart';

part 'drift_init.g.dart';

@DriftDatabase(tables: [DictionariesDto, WordsDto])
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
        print('Создание таблиц базы данных');
        await m.createAll();
        print('Таблицы созданы успешно');
      },
      beforeOpen: (openingDetails) async {
        // final m = Migrator(this);
        // for (final table in allTables) {
        //   await m.deleteTable(table.actualTableName);
        //   await m.createTable(table);
        // }
      },
    );
  }
}
