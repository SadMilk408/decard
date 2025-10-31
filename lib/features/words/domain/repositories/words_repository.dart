import 'package:english_training_app/features/words/data/words_api/words_api.dart';
import 'package:english_training_app/features/words/domain/entities/entities.dart';

// TODO: add error handling
class WordsRepository {
  WordsRepository({required WordsApi wordsApi}) : _wordsApi = wordsApi;

  final WordsApi _wordsApi;

  Stream<List<Word>> watchWordsByDictId(int dictionaryId) =>
      _wordsApi.watchWordsByDictId(dictionaryId);

  Future<void> saveWord(Word word) => _wordsApi.saveWord(word);

  Future<void> updateWord(Word word) => _wordsApi.updateWord(word);

  Future<Word> getWordById(int id) => _wordsApi.getWordById(id);

  Future<Word> deleteWordById(int id) async {
    final word = await _wordsApi.deleteWordById(id);
    return word;
  }
}
