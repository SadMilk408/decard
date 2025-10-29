import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';

abstract class DictionaryApi {
  DictionaryApi();

  Stream<List<Dictionary>> watchDicts();

  Future<void> saveDict(Dictionary dictionary);

  Future<void> updateDict(Dictionary dictionary);

  Future<Dictionary> getDictById(int id);

  Future<Dictionary> deleteDictById(int id);
}
