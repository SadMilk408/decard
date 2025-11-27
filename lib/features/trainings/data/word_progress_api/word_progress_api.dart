import 'package:english_training_app/services/drift_init.dart';

abstract class WordProgressApi {
  WordProgressApi();

  /// Получить прогрессы для списка wordIds
  Future<List<WordProgressDtoData>> getProgressForWordIds(List<int> wordIds);

  Future<void> deleteAllWordsProgress();

  Future<void> setIsLearning({required int wordId, required bool isLearning});
}
