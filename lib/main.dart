import 'package:english_training_app/bootstrap.dart';
import 'package:flutter/material.dart';

import 'features/dictionaries/data/dictionary_api/dictionary_dao.dart';
import 'features/trainings/data/word_progress_api/word_progress_dao.dart';
import 'features/words/data/words_api/words_dao.dart';
import 'services/drift_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  // Можно очистить БД для тестирования
  // await database.deleteDatabase();

  final dictionaryApi = DictionaryDao(database);
  final wordsApi = WordsDao(database);
  final wordProgressApi = WordProgressDao(database);

  bootstrap(
    dictionaryApi: dictionaryApi,
    wordsApi: wordsApi,
    wordProgressApi: wordProgressApi,
  );
}
