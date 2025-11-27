import 'package:drift/drift.dart';

import 'package:english_training_app/features/words/words_export.dart';

class WordProgressDto extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wordId => integer().references(WordsDto, #id)();
  BoolColumn get isLearning => boolean().withDefault(const Constant(false))();
}

// Возможное мастабирование таблицы
/*

class WordProgressDto extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get wordId => integer().references(WordsDto, #id)();

  // Текущий статус изучения
  TextColumn get status => text().withDefault(const Constant('learning'))();
  // learning / learned / suspended

  // Статистика
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();

  // Сколько раз подряд правильно
  IntColumn get streak => integer().withDefault(const Constant(0))();

  // Время последней тренировки
  DateTimeColumn get lastTrainedAt => dateTime().nullable()();

  // Когда показывать снова (для интервального повторения)
  DateTimeColumn get nextReviewAt => dateTime().nullable()();
}

*/
