import 'package:drift/drift.dart';
import 'package:english_training_app/features/dictionaries/data/dictionary_api/dictionary_api.dart';
import 'package:english_training_app/features/dictionaries/data/tables/tables.dart';
import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:english_training_app/features/words/data/tables/tables.dart';
import 'package:english_training_app/services/drift_init.dart';

part 'dictionary_dao.g.dart';

@DriftAccessor(tables: [DictionariesDto, WordsDto])
class DictionaryDao extends DatabaseAccessor<AppDatabase>
    with _$DictionaryDaoMixin
    implements DictionaryApi {
  DictionaryDao(super.attachedDatabase);

  @override
  Stream<List<Dictionary>> watchDicts() {
    final countExpr = wordsDto.id.count();

    final query =
        select(dictionariesDto).join([
            leftOuterJoin(
              wordsDto,
              wordsDto.dictionaryId.equalsExp(dictionariesDto.id),
            ),
          ])
          ..addColumns([countExpr])
          ..groupBy([dictionariesDto.id]);

    return query.watch().map((rows) {
      return rows.map((r) {
        final dict = r.readTable(dictionariesDto);
        final count = r.read(countExpr) ?? 0;

        return Dictionary(id: dict.id, title: dict.title, wordsCount: count);
      }).toList();
    });
  }

  @override
  Future<void> saveDict(Dictionary dictionary) async {
    await into(
      dictionariesDto,
    ).insert(DictionariesDtoCompanion.insert(title: dictionary.title));
  }

  @override
  Future<void> updateDict(Dictionary dictionary) async {
    if (dictionary.id == null) {
      throw Exception('ID словаря не найден');
    }

    final existing = await _getDtoById(dictionary.id!);

    if (existing != null) {
      await update(dictionariesDto).replace(
        DictionariesDtoCompanion(
          id: Value(existing.id),
          title: Value(dictionary.title),
        ),
      );
    }
  }

  @override
  Future<Dictionary> getDictById(int id) async {
    final dto = await _getDtoById(id);

    if (dto == null) {
      throw Exception('Словарь не найден');
    }

    return Dictionary(id: dto.id, title: dto.title);
  }

  @override
  Future<Dictionary> deleteDictById(int id) async {
    final dto = await _getDtoById(id);
    if (dto == null) {
      throw Exception('Словарь не найден');
    }
    await (delete(dictionariesDto)..where((t) => t.id.equals(id))).go();

    return Dictionary(id: dto.id, title: dto.title);
  }

  Future<DictionariesDtoData?> _getDtoById(int id) async {
    return (select(dictionariesDto)
      ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
