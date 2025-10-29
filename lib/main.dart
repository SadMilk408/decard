import 'package:english_training_app/bootstrap.dart';
import 'package:flutter/material.dart';

import 'features/dictionaries/data/dictionary_api/dictionary_dao.dart';
import 'features/dictionaries/data/words_api/words_dao.dart';
import 'services/drift_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  final dictionaryApi = DictionaryDao(database);
  final wordsApi = WordsDao(database);

  bootstrap(dictionaryApi: dictionaryApi, wordsApi: wordsApi);
}
