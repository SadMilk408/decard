import 'package:english_training_app/features/dictionaries/data/data.dart';
import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';

// TODO: add error handling
class DictRepository {
  DictRepository({required DictionaryApi dictionaryApi})
    : _dictionaryApi = dictionaryApi;

  final DictionaryApi _dictionaryApi;

  Stream<List<Dictionary>> watchDicts() => _dictionaryApi.watchDicts();

  Future<void> saveDict(Dictionary dictionary) =>
      _dictionaryApi.saveDict(dictionary);

  Future<void> updateDict(Dictionary dictionary) =>
      _dictionaryApi.updateDict(dictionary);

  Future<Dictionary> getDictById(int id) => _dictionaryApi.getDictById(id);

  Future<Dictionary> deleteDictById(int id) async {
    final dictionary = await _dictionaryApi.deleteDictById(id);
    return dictionary;
  }
}
