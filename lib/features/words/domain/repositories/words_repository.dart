import 'package:english_training_app/features/words/data/words_api/words_api.dart';
import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/features/words/domain/entities/word_form_data.dart';

// TODO: add error handling
class WordsRepository {
  WordsRepository({required WordsApi wordsApi}) : _wordsApi = wordsApi;

  final WordsApi _wordsApi;

  Stream<List<Word>> watchWordsByDictId(int dictionaryId) =>
      _wordsApi.watchWordsByDictId(dictionaryId);

  Future<void> saveWord(WordFormData data) => _wordsApi.saveWord(data);

  Future<void> updateWord(WordFormData data) => _wordsApi.updateWord(data);

  Future<Word> getWordById(int id) => _wordsApi.getWordById(id);

  Future<Word> deleteWordById(int id) async {
    final word = await _wordsApi.deleteWordById(id);
    return word;
  }
}
