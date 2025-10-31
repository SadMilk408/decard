import 'package:english_training_app/features/words/domain/entities/entities.dart';

abstract class WordsApi {
  WordsApi();

  Stream<List<Word>> watchWordsByDictId(int dictionaryId);

  Future<void> saveWord(Word word);

  Future<void> updateWord(Word word);

  Future<Word> getWordById(int id);

  Future<Word> deleteWordById(int id);
}
