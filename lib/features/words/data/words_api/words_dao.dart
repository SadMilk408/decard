import 'package:drift/drift.dart';
import 'package:english_training_app/features/words/data/words_api/words_api.dart';
import 'package:english_training_app/features/words/data/tables/words_table.dart';
import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/services/drift_init.dart';

part 'words_dao.g.dart';

@DriftAccessor(tables: [WordsDto])
class WordsDao extends DatabaseAccessor<AppDatabase>
    with _$WordsDaoMixin
    implements WordsApi {
  WordsDao(super.attachedDatabase);

  @override
  Stream<List<Word>> watchWordsByDictId(int dictionaryId) {
    return (select(wordsDto)..where(
      (tbl) => tbl.dictionaryId.equals(dictionaryId),
    )).watch().map((list) {
      return list
          .map(
            (dto) => Word(
              id: dto.id,
              dictionaryId: dto.dictionaryId,
              mainWord: dto.mainWord,
              translate: dto.translate,
              example: dto.example,
              translationExample: dto.translationExample,
              definition: dto.definition,
              translationDefinition: dto.translationDefinition,
            ),
          )
          .toList();
    });
  }

  @override
  Future<void> saveWord(Word word) async {
    await into(wordsDto).insert(
      WordsDtoCompanion.insert(
        dictionaryId: word.dictionaryId,
        mainWord: word.mainWord,
        translate: word.translate,
        example: Value(word.example),
        translationExample: Value(word.translationExample),
        definition: Value(word.definition),
        translationDefinition: Value(word.translationDefinition),
      ),
    );
  }

  @override
  Future<void> updateWord(Word word) async {
    // TODO: implement updateWord
  }

  @override
  Future<Word> getWordById(int id) async {
    // TODO: implement getWordById
    throw UnimplementedError();
  }

  @override
  Future<Word> deleteWordById(int id) async {
    // TODO: implement deleteWordById
    throw UnimplementedError();
  }
}
