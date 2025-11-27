import 'package:english_training_app/features/trainings/data/word_progress_api/word_progress_api.dart';
import 'package:english_training_app/features/trainings/domain/entities/training_stats.dart';
import 'package:english_training_app/features/trainings/domain/repositories/word_progress_repository.dart';
import 'package:english_training_app/features/words/domain/entities/word.dart';

class WordProgressRepository implements IWordProgressRepository {
  WordProgressRepository({required WordProgressApi wordProgressApi})
    : _wordProgressApi = wordProgressApi;

  final WordProgressApi _wordProgressApi;

  @override
  Future<void> deleteAllWordsProgress() {
    return _wordProgressApi.deleteAllWordsProgress();
  }

  @override
  Future<void> setIsLearning({required int wordId, required bool isLearning}) {
    return _wordProgressApi.setIsLearning(
      wordId: wordId,
      isLearning: isLearning,
    );
  }

  @override
  Future<List<Word>> getWordsForTraining(List<Word> words) async {
    if (words.isEmpty) {
      return [];
    }

    final ids = words.map((w) => w.id).toList();

    // Берём все прогрессы для этих слов
    final progressList = await _wordProgressApi.getProgressForWordIds(ids);

    // wordId -> progress
    final progressMap = {for (final dto in progressList) dto.wordId: dto};

    // В тренировку идут только слова, у которых прогресса ещё нет
    final wordsForTraining =
        words.where((word) {
          final progress = progressMap[word.id];
          return progress == null;
        }).toList();

    return wordsForTraining;
  }

  @override
  Future<TrainingStats> getTrainingStats(List<Word> words) async {
    if (words.isEmpty) {
      return TrainingStats(learningCount: 0, learnedCount: 0, newCount: 0);
    }

    final ids = words.map((w) => w.id).toList();

    final progressList = await _wordProgressApi.getProgressForWordIds(ids);

    final progressMap = {for (final dto in progressList) dto.wordId: dto};

    int learningCount = 0;
    int learnedCount = 0;
    int newCount = 0;

    for (final word in words) {
      final progress = progressMap[word.id];

      if (progress == null) {
        // слова без прогресса
        newCount++;
      } else {
        if (progress.isLearning) {
          learningCount++;
        } else {
          learnedCount++;
        }
      }
    }

    return TrainingStats(
      learningCount: learningCount,
      learnedCount: learnedCount,
      newCount: newCount,
    );
  }
}
