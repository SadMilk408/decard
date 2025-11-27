import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/features/words/domain/entities/word_form_data.dart';

abstract class WordsApi {
  WordsApi();

  Stream<List<Word>> watchWordsByDictId(int dictionaryId);

  Future<void> saveWord(WordFormData data);

  Future<void> updateWord(WordFormData data);

  Future<Word> getWordById(int id);

  Future<Word> deleteWordById(int id);
}
