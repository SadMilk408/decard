import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:english_training_app/features/trainings/data/tables/word_progress.dart';
import 'package:english_training_app/services/drift_init.dart';

import 'word_progress_api.dart';

part 'word_progress_dao.g.dart';

@DriftAccessor(tables: [WordProgressDto])
class WordProgressDao extends DatabaseAccessor<AppDatabase>
    with _$WordProgressDaoMixin
    implements WordProgressApi {
  WordProgressDao(super.attachedDatabase);

  @override
  Future<List<WordProgressDtoData>> getProgressForWordIds(
    List<int> wordIds,
  ) async {
    if (wordIds.isEmpty) {
      return [];
    }

    return await (select(wordProgressDto)
      ..where((tbl) => tbl.wordId.isIn(wordIds))).get();
  }

  @override
  Future<void> setIsLearning({
    required int wordId,
    required bool isLearning,
  }) async {
    try {
      // Сначала пробуем обновить существующую запись по wordId
      final updatedCount = await (update(wordProgressDto)..where(
        (tbl) => tbl.wordId.equals(wordId),
      )).write(WordProgressDtoCompanion(isLearning: Value(isLearning)));

      // Если не было ни одной строки с таким wordId — вставляем новую
      if (updatedCount == 0) {
        await into(wordProgressDto).insert(
          WordProgressDtoCompanion.insert(
            wordId: wordId,
            isLearning: Value(isLearning),
          ),
        );
      }
    } catch (e) {
      log('setIsNeedToRepeate error: $e');
    }
  }

  @override
  Future<void> deleteAllWordsProgress() async {
    await delete(wordProgressDto).go();
  }
}
