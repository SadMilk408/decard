import 'package:english_training_app/features/trainings/domain/entities/training_stats.dart';
import 'package:english_training_app/features/words/domain/entities/word.dart';

abstract class IWordProgressRepository {
  /// Удалить все прогрессы
  Future<void> deleteAllWordsProgress();

  /// Установить значение isNeedToRepeate (upsert: создаст запись, если её нет)
  Future<void> setIsLearning({required int wordId, required bool isLearning});

  /// Получить слова для повторения в тренировке
  Future<List<Word>> getWordsForTraining(List<Word> words);

  /// Получить статистику тренировки
  Future<TrainingStats> getTrainingStats(List<Word> words);
}
