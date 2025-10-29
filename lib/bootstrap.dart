import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:english_training_app/app/app.dart';
import 'package:english_training_app/app/app_bloc_observer.dart';

import 'features/dictionaries/data/data.dart';
import 'features/dictionaries/domain/repositories/repositories.dart';

void bootstrap({
  required DictionaryApi dictionaryApi,
  required WordsApi wordsApi,
}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };

  Bloc.observer = const AppBlocObserver();

  runApp(
    App(
      createDictionaryRepository:
          () => DictRepository(dictionaryApi: dictionaryApi),
      createWordsRepository: () => WordsRepository(wordsApi: wordsApi),
    ),
  );
}
