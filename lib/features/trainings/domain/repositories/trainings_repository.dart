import 'package:english_training_app/features/words/domain/entities/word.dart';

abstract class TrainingRepository {
  Future<List<Word>> getWordsForTraining(int dictionaryId);
  Future<void> updateProgressOnSwipe({
    required int wordId,
    required bool isNeedToRepeate,
  });
}
