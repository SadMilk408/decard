// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_init.dart';

// ignore_for_file: type=lint
class $DictionariesDtoTable extends DictionariesDto
    with TableInfo<$DictionariesDtoTable, DictionariesDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DictionariesDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionaries_dto';
  @override
  VerificationContext validateIntegrity(
    Insertable<DictionariesDtoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DictionariesDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionariesDtoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
    );
  }

  @override
  $DictionariesDtoTable createAlias(String alias) {
    return $DictionariesDtoTable(attachedDatabase, alias);
  }
}

class DictionariesDtoData extends DataClass
    implements Insertable<DictionariesDtoData> {
  final int id;
  final String title;
  const DictionariesDtoData({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  DictionariesDtoCompanion toCompanion(bool nullToAbsent) {
    return DictionariesDtoCompanion(id: Value(id), title: Value(title));
  }

  factory DictionariesDtoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionariesDtoData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  DictionariesDtoData copyWith({int? id, String? title}) =>
      DictionariesDtoData(id: id ?? this.id, title: title ?? this.title);
  DictionariesDtoData copyWithCompanion(DictionariesDtoCompanion data) {
    return DictionariesDtoData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DictionariesDtoData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionariesDtoData &&
          other.id == this.id &&
          other.title == this.title);
}

class DictionariesDtoCompanion extends UpdateCompanion<DictionariesDtoData> {
  final Value<int> id;
  final Value<String> title;
  const DictionariesDtoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  DictionariesDtoCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<DictionariesDtoData> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  DictionariesDtoCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return DictionariesDtoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionariesDtoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $WordsDtoTable extends WordsDto
    with TableInfo<$WordsDtoTable, WordsDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _mainWordMeta = const VerificationMeta(
    'mainWord',
  );
  @override
  late final GeneratedColumn<String> mainWord = GeneratedColumn<String>(
    'main_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translateMeta = const VerificationMeta(
    'translate',
  );
  @override
  late final GeneratedColumn<String> translate = GeneratedColumn<String>(
    'translate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exampleMeta = const VerificationMeta(
    'example',
  );
  @override
  late final GeneratedColumn<String> example = GeneratedColumn<String>(
    'example',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _translationExampleMeta =
      const VerificationMeta('translationExample');
  @override
  late final GeneratedColumn<String> translationExample =
      GeneratedColumn<String>(
        'translation_example',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _definitionMeta = const VerificationMeta(
    'definition',
  );
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
    'definition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _translationDefinitionMeta =
      const VerificationMeta('translationDefinition');
  @override
  late final GeneratedColumn<String> translationDefinition =
      GeneratedColumn<String>(
        'translation_definition',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dictionaryIdMeta = const VerificationMeta(
    'dictionaryId',
  );
  @override
  late final GeneratedColumn<int> dictionaryId = GeneratedColumn<int>(
    'dictionary_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dictionaries_dto (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mainWord,
    translate,
    example,
    translationExample,
    definition,
    translationDefinition,
    dictionaryId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words_dto';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordsDtoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('main_word')) {
      context.handle(
        _mainWordMeta,
        mainWord.isAcceptableOrUnknown(data['main_word']!, _mainWordMeta),
      );
    } else if (isInserting) {
      context.missing(_mainWordMeta);
    }
    if (data.containsKey('translate')) {
      context.handle(
        _translateMeta,
        translate.isAcceptableOrUnknown(data['translate']!, _translateMeta),
      );
    } else if (isInserting) {
      context.missing(_translateMeta);
    }
    if (data.containsKey('example')) {
      context.handle(
        _exampleMeta,
        example.isAcceptableOrUnknown(data['example']!, _exampleMeta),
      );
    }
    if (data.containsKey('translation_example')) {
      context.handle(
        _translationExampleMeta,
        translationExample.isAcceptableOrUnknown(
          data['translation_example']!,
          _translationExampleMeta,
        ),
      );
    }
    if (data.containsKey('definition')) {
      context.handle(
        _definitionMeta,
        definition.isAcceptableOrUnknown(data['definition']!, _definitionMeta),
      );
    }
    if (data.containsKey('translation_definition')) {
      context.handle(
        _translationDefinitionMeta,
        translationDefinition.isAcceptableOrUnknown(
          data['translation_definition']!,
          _translationDefinitionMeta,
        ),
      );
    }
    if (data.containsKey('dictionary_id')) {
      context.handle(
        _dictionaryIdMeta,
        dictionaryId.isAcceptableOrUnknown(
          data['dictionary_id']!,
          _dictionaryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dictionaryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordsDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordsDtoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      mainWord:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}main_word'],
          )!,
      translate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}translate'],
          )!,
      example: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}example'],
      ),
      translationExample: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_example'],
      ),
      definition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}definition'],
      ),
      translationDefinition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_definition'],
      ),
      dictionaryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}dictionary_id'],
          )!,
    );
  }

  @override
  $WordsDtoTable createAlias(String alias) {
    return $WordsDtoTable(attachedDatabase, alias);
  }
}

class WordsDtoData extends DataClass implements Insertable<WordsDtoData> {
  final int id;
  final String mainWord;
  final String translate;
  final String? example;
  final String? translationExample;
  final String? definition;
  final String? translationDefinition;
  final int dictionaryId;
  const WordsDtoData({
    required this.id,
    required this.mainWord,
    required this.translate,
    this.example,
    this.translationExample,
    this.definition,
    this.translationDefinition,
    required this.dictionaryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['main_word'] = Variable<String>(mainWord);
    map['translate'] = Variable<String>(translate);
    if (!nullToAbsent || example != null) {
      map['example'] = Variable<String>(example);
    }
    if (!nullToAbsent || translationExample != null) {
      map['translation_example'] = Variable<String>(translationExample);
    }
    if (!nullToAbsent || definition != null) {
      map['definition'] = Variable<String>(definition);
    }
    if (!nullToAbsent || translationDefinition != null) {
      map['translation_definition'] = Variable<String>(translationDefinition);
    }
    map['dictionary_id'] = Variable<int>(dictionaryId);
    return map;
  }

  WordsDtoCompanion toCompanion(bool nullToAbsent) {
    return WordsDtoCompanion(
      id: Value(id),
      mainWord: Value(mainWord),
      translate: Value(translate),
      example:
          example == null && nullToAbsent
              ? const Value.absent()
              : Value(example),
      translationExample:
          translationExample == null && nullToAbsent
              ? const Value.absent()
              : Value(translationExample),
      definition:
          definition == null && nullToAbsent
              ? const Value.absent()
              : Value(definition),
      translationDefinition:
          translationDefinition == null && nullToAbsent
              ? const Value.absent()
              : Value(translationDefinition),
      dictionaryId: Value(dictionaryId),
    );
  }

  factory WordsDtoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordsDtoData(
      id: serializer.fromJson<int>(json['id']),
      mainWord: serializer.fromJson<String>(json['mainWord']),
      translate: serializer.fromJson<String>(json['translate']),
      example: serializer.fromJson<String?>(json['example']),
      translationExample: serializer.fromJson<String?>(
        json['translationExample'],
      ),
      definition: serializer.fromJson<String?>(json['definition']),
      translationDefinition: serializer.fromJson<String?>(
        json['translationDefinition'],
      ),
      dictionaryId: serializer.fromJson<int>(json['dictionaryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mainWord': serializer.toJson<String>(mainWord),
      'translate': serializer.toJson<String>(translate),
      'example': serializer.toJson<String?>(example),
      'translationExample': serializer.toJson<String?>(translationExample),
      'definition': serializer.toJson<String?>(definition),
      'translationDefinition': serializer.toJson<String?>(
        translationDefinition,
      ),
      'dictionaryId': serializer.toJson<int>(dictionaryId),
    };
  }

  WordsDtoData copyWith({
    int? id,
    String? mainWord,
    String? translate,
    Value<String?> example = const Value.absent(),
    Value<String?> translationExample = const Value.absent(),
    Value<String?> definition = const Value.absent(),
    Value<String?> translationDefinition = const Value.absent(),
    int? dictionaryId,
  }) => WordsDtoData(
    id: id ?? this.id,
    mainWord: mainWord ?? this.mainWord,
    translate: translate ?? this.translate,
    example: example.present ? example.value : this.example,
    translationExample:
        translationExample.present
            ? translationExample.value
            : this.translationExample,
    definition: definition.present ? definition.value : this.definition,
    translationDefinition:
        translationDefinition.present
            ? translationDefinition.value
            : this.translationDefinition,
    dictionaryId: dictionaryId ?? this.dictionaryId,
  );
  WordsDtoData copyWithCompanion(WordsDtoCompanion data) {
    return WordsDtoData(
      id: data.id.present ? data.id.value : this.id,
      mainWord: data.mainWord.present ? data.mainWord.value : this.mainWord,
      translate: data.translate.present ? data.translate.value : this.translate,
      example: data.example.present ? data.example.value : this.example,
      translationExample:
          data.translationExample.present
              ? data.translationExample.value
              : this.translationExample,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      translationDefinition:
          data.translationDefinition.present
              ? data.translationDefinition.value
              : this.translationDefinition,
      dictionaryId:
          data.dictionaryId.present
              ? data.dictionaryId.value
              : this.dictionaryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordsDtoData(')
          ..write('id: $id, ')
          ..write('mainWord: $mainWord, ')
          ..write('translate: $translate, ')
          ..write('example: $example, ')
          ..write('translationExample: $translationExample, ')
          ..write('definition: $definition, ')
          ..write('translationDefinition: $translationDefinition, ')
          ..write('dictionaryId: $dictionaryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mainWord,
    translate,
    example,
    translationExample,
    definition,
    translationDefinition,
    dictionaryId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordsDtoData &&
          other.id == this.id &&
          other.mainWord == this.mainWord &&
          other.translate == this.translate &&
          other.example == this.example &&
          other.translationExample == this.translationExample &&
          other.definition == this.definition &&
          other.translationDefinition == this.translationDefinition &&
          other.dictionaryId == this.dictionaryId);
}

class WordsDtoCompanion extends UpdateCompanion<WordsDtoData> {
  final Value<int> id;
  final Value<String> mainWord;
  final Value<String> translate;
  final Value<String?> example;
  final Value<String?> translationExample;
  final Value<String?> definition;
  final Value<String?> translationDefinition;
  final Value<int> dictionaryId;
  const WordsDtoCompanion({
    this.id = const Value.absent(),
    this.mainWord = const Value.absent(),
    this.translate = const Value.absent(),
    this.example = const Value.absent(),
    this.translationExample = const Value.absent(),
    this.definition = const Value.absent(),
    this.translationDefinition = const Value.absent(),
    this.dictionaryId = const Value.absent(),
  });
  WordsDtoCompanion.insert({
    this.id = const Value.absent(),
    required String mainWord,
    required String translate,
    this.example = const Value.absent(),
    this.translationExample = const Value.absent(),
    this.definition = const Value.absent(),
    this.translationDefinition = const Value.absent(),
    required int dictionaryId,
  }) : mainWord = Value(mainWord),
       translate = Value(translate),
       dictionaryId = Value(dictionaryId);
  static Insertable<WordsDtoData> custom({
    Expression<int>? id,
    Expression<String>? mainWord,
    Expression<String>? translate,
    Expression<String>? example,
    Expression<String>? translationExample,
    Expression<String>? definition,
    Expression<String>? translationDefinition,
    Expression<int>? dictionaryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mainWord != null) 'main_word': mainWord,
      if (translate != null) 'translate': translate,
      if (example != null) 'example': example,
      if (translationExample != null) 'translation_example': translationExample,
      if (definition != null) 'definition': definition,
      if (translationDefinition != null)
        'translation_definition': translationDefinition,
      if (dictionaryId != null) 'dictionary_id': dictionaryId,
    });
  }

  WordsDtoCompanion copyWith({
    Value<int>? id,
    Value<String>? mainWord,
    Value<String>? translate,
    Value<String?>? example,
    Value<String?>? translationExample,
    Value<String?>? definition,
    Value<String?>? translationDefinition,
    Value<int>? dictionaryId,
  }) {
    return WordsDtoCompanion(
      id: id ?? this.id,
      mainWord: mainWord ?? this.mainWord,
      translate: translate ?? this.translate,
      example: example ?? this.example,
      translationExample: translationExample ?? this.translationExample,
      definition: definition ?? this.definition,
      translationDefinition:
          translationDefinition ?? this.translationDefinition,
      dictionaryId: dictionaryId ?? this.dictionaryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mainWord.present) {
      map['main_word'] = Variable<String>(mainWord.value);
    }
    if (translate.present) {
      map['translate'] = Variable<String>(translate.value);
    }
    if (example.present) {
      map['example'] = Variable<String>(example.value);
    }
    if (translationExample.present) {
      map['translation_example'] = Variable<String>(translationExample.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (translationDefinition.present) {
      map['translation_definition'] = Variable<String>(
        translationDefinition.value,
      );
    }
    if (dictionaryId.present) {
      map['dictionary_id'] = Variable<int>(dictionaryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsDtoCompanion(')
          ..write('id: $id, ')
          ..write('mainWord: $mainWord, ')
          ..write('translate: $translate, ')
          ..write('example: $example, ')
          ..write('translationExample: $translationExample, ')
          ..write('definition: $definition, ')
          ..write('translationDefinition: $translationDefinition, ')
          ..write('dictionaryId: $dictionaryId')
          ..write(')'))
        .toString();
  }
}

class $WordProgressDtoTable extends WordProgressDto
    with TableInfo<$WordProgressDtoTable, WordProgressDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordProgressDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
    'word_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words_dto (id)',
    ),
  );
  static const VerificationMeta _isLearningMeta = const VerificationMeta(
    'isLearning',
  );
  @override
  late final GeneratedColumn<bool> isLearning = GeneratedColumn<bool>(
    'is_learning',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_learning" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, wordId, isLearning];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_progress_dto';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordProgressDtoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word_id')) {
      context.handle(
        _wordIdMeta,
        wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('is_learning')) {
      context.handle(
        _isLearningMeta,
        isLearning.isAcceptableOrUnknown(data['is_learning']!, _isLearningMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordProgressDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordProgressDtoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      wordId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}word_id'],
          )!,
      isLearning:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_learning'],
          )!,
    );
  }

  @override
  $WordProgressDtoTable createAlias(String alias) {
    return $WordProgressDtoTable(attachedDatabase, alias);
  }
}

class WordProgressDtoData extends DataClass
    implements Insertable<WordProgressDtoData> {
  final int id;
  final int wordId;
  final bool isLearning;
  const WordProgressDtoData({
    required this.id,
    required this.wordId,
    required this.isLearning,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word_id'] = Variable<int>(wordId);
    map['is_learning'] = Variable<bool>(isLearning);
    return map;
  }

  WordProgressDtoCompanion toCompanion(bool nullToAbsent) {
    return WordProgressDtoCompanion(
      id: Value(id),
      wordId: Value(wordId),
      isLearning: Value(isLearning),
    );
  }

  factory WordProgressDtoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordProgressDtoData(
      id: serializer.fromJson<int>(json['id']),
      wordId: serializer.fromJson<int>(json['wordId']),
      isLearning: serializer.fromJson<bool>(json['isLearning']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wordId': serializer.toJson<int>(wordId),
      'isLearning': serializer.toJson<bool>(isLearning),
    };
  }

  WordProgressDtoData copyWith({int? id, int? wordId, bool? isLearning}) =>
      WordProgressDtoData(
        id: id ?? this.id,
        wordId: wordId ?? this.wordId,
        isLearning: isLearning ?? this.isLearning,
      );
  WordProgressDtoData copyWithCompanion(WordProgressDtoCompanion data) {
    return WordProgressDtoData(
      id: data.id.present ? data.id.value : this.id,
      wordId: data.wordId.present ? data.wordId.value : this.wordId,
      isLearning:
          data.isLearning.present ? data.isLearning.value : this.isLearning,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordProgressDtoData(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('isLearning: $isLearning')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, wordId, isLearning);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordProgressDtoData &&
          other.id == this.id &&
          other.wordId == this.wordId &&
          other.isLearning == this.isLearning);
}

class WordProgressDtoCompanion extends UpdateCompanion<WordProgressDtoData> {
  final Value<int> id;
  final Value<int> wordId;
  final Value<bool> isLearning;
  const WordProgressDtoCompanion({
    this.id = const Value.absent(),
    this.wordId = const Value.absent(),
    this.isLearning = const Value.absent(),
  });
  WordProgressDtoCompanion.insert({
    this.id = const Value.absent(),
    required int wordId,
    this.isLearning = const Value.absent(),
  }) : wordId = Value(wordId);
  static Insertable<WordProgressDtoData> custom({
    Expression<int>? id,
    Expression<int>? wordId,
    Expression<bool>? isLearning,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wordId != null) 'word_id': wordId,
      if (isLearning != null) 'is_learning': isLearning,
    });
  }

  WordProgressDtoCompanion copyWith({
    Value<int>? id,
    Value<int>? wordId,
    Value<bool>? isLearning,
  }) {
    return WordProgressDtoCompanion(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      isLearning: isLearning ?? this.isLearning,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
    }
    if (isLearning.present) {
      map['is_learning'] = Variable<bool>(isLearning.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordProgressDtoCompanion(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('isLearning: $isLearning')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DictionariesDtoTable dictionariesDto = $DictionariesDtoTable(
    this,
  );
  late final $WordsDtoTable wordsDto = $WordsDtoTable(this);
  late final $WordProgressDtoTable wordProgressDto = $WordProgressDtoTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dictionariesDto,
    wordsDto,
    wordProgressDto,
  ];
}

typedef $$DictionariesDtoTableCreateCompanionBuilder =
    DictionariesDtoCompanion Function({Value<int> id, required String title});
typedef $$DictionariesDtoTableUpdateCompanionBuilder =
    DictionariesDtoCompanion Function({Value<int> id, Value<String> title});

final class $$DictionariesDtoTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DictionariesDtoTable,
          DictionariesDtoData
        > {
  $$DictionariesDtoTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$WordsDtoTable, List<WordsDtoData>>
  _wordsDtoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.wordsDto,
    aliasName: $_aliasNameGenerator(
      db.dictionariesDto.id,
      db.wordsDto.dictionaryId,
    ),
  );

  $$WordsDtoTableProcessedTableManager get wordsDtoRefs {
    final manager = $$WordsDtoTableTableManager(
      $_db,
      $_db.wordsDto,
    ).filter((f) => f.dictionaryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_wordsDtoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DictionariesDtoTableFilterComposer
    extends Composer<_$AppDatabase, $DictionariesDtoTable> {
  $$DictionariesDtoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> wordsDtoRefs(
    Expression<bool> Function($$WordsDtoTableFilterComposer f) f,
  ) {
    final $$WordsDtoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.wordsDto,
      getReferencedColumn: (t) => t.dictionaryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsDtoTableFilterComposer(
            $db: $db,
            $table: $db.wordsDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DictionariesDtoTableOrderingComposer
    extends Composer<_$AppDatabase, $DictionariesDtoTable> {
  $$DictionariesDtoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DictionariesDtoTableAnnotationComposer
    extends Composer<_$AppDatabase, $DictionariesDtoTable> {
  $$DictionariesDtoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> wordsDtoRefs<T extends Object>(
    Expression<T> Function($$WordsDtoTableAnnotationComposer a) f,
  ) {
    final $$WordsDtoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.wordsDto,
      getReferencedColumn: (t) => t.dictionaryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsDtoTableAnnotationComposer(
            $db: $db,
            $table: $db.wordsDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DictionariesDtoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DictionariesDtoTable,
          DictionariesDtoData,
          $$DictionariesDtoTableFilterComposer,
          $$DictionariesDtoTableOrderingComposer,
          $$DictionariesDtoTableAnnotationComposer,
          $$DictionariesDtoTableCreateCompanionBuilder,
          $$DictionariesDtoTableUpdateCompanionBuilder,
          (DictionariesDtoData, $$DictionariesDtoTableReferences),
          DictionariesDtoData,
          PrefetchHooks Function({bool wordsDtoRefs})
        > {
  $$DictionariesDtoTableTableManager(
    _$AppDatabase db,
    $DictionariesDtoTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$DictionariesDtoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DictionariesDtoTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$DictionariesDtoTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) => DictionariesDtoCompanion(id: id, title: title),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String title}) =>
                  DictionariesDtoCompanion.insert(id: id, title: title),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DictionariesDtoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({wordsDtoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (wordsDtoRefs) db.wordsDto],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (wordsDtoRefs)
                    await $_getPrefetchedData<
                      DictionariesDtoData,
                      $DictionariesDtoTable,
                      WordsDtoData
                    >(
                      currentTable: table,
                      referencedTable: $$DictionariesDtoTableReferences
                          ._wordsDtoRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DictionariesDtoTableReferences(
                                db,
                                table,
                                p0,
                              ).wordsDtoRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.dictionaryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DictionariesDtoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DictionariesDtoTable,
      DictionariesDtoData,
      $$DictionariesDtoTableFilterComposer,
      $$DictionariesDtoTableOrderingComposer,
      $$DictionariesDtoTableAnnotationComposer,
      $$DictionariesDtoTableCreateCompanionBuilder,
      $$DictionariesDtoTableUpdateCompanionBuilder,
      (DictionariesDtoData, $$DictionariesDtoTableReferences),
      DictionariesDtoData,
      PrefetchHooks Function({bool wordsDtoRefs})
    >;
typedef $$WordsDtoTableCreateCompanionBuilder =
    WordsDtoCompanion Function({
      Value<int> id,
      required String mainWord,
      required String translate,
      Value<String?> example,
      Value<String?> translationExample,
      Value<String?> definition,
      Value<String?> translationDefinition,
      required int dictionaryId,
    });
typedef $$WordsDtoTableUpdateCompanionBuilder =
    WordsDtoCompanion Function({
      Value<int> id,
      Value<String> mainWord,
      Value<String> translate,
      Value<String?> example,
      Value<String?> translationExample,
      Value<String?> definition,
      Value<String?> translationDefinition,
      Value<int> dictionaryId,
    });

final class $$WordsDtoTableReferences
    extends BaseReferences<_$AppDatabase, $WordsDtoTable, WordsDtoData> {
  $$WordsDtoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DictionariesDtoTable _dictionaryIdTable(_$AppDatabase db) =>
      db.dictionariesDto.createAlias(
        $_aliasNameGenerator(db.wordsDto.dictionaryId, db.dictionariesDto.id),
      );

  $$DictionariesDtoTableProcessedTableManager get dictionaryId {
    final $_column = $_itemColumn<int>('dictionary_id')!;

    final manager = $$DictionariesDtoTableTableManager(
      $_db,
      $_db.dictionariesDto,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dictionaryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WordProgressDtoTable, List<WordProgressDtoData>>
  _wordProgressDtoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.wordProgressDto,
    aliasName: $_aliasNameGenerator(db.wordsDto.id, db.wordProgressDto.wordId),
  );

  $$WordProgressDtoTableProcessedTableManager get wordProgressDtoRefs {
    final manager = $$WordProgressDtoTableTableManager(
      $_db,
      $_db.wordProgressDto,
    ).filter((f) => f.wordId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _wordProgressDtoRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WordsDtoTableFilterComposer
    extends Composer<_$AppDatabase, $WordsDtoTable> {
  $$WordsDtoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainWord => $composableBuilder(
    column: $table.mainWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translate => $composableBuilder(
    column: $table.translate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get example => $composableBuilder(
    column: $table.example,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationExample => $composableBuilder(
    column: $table.translationExample,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationDefinition => $composableBuilder(
    column: $table.translationDefinition,
    builder: (column) => ColumnFilters(column),
  );

  $$DictionariesDtoTableFilterComposer get dictionaryId {
    final $$DictionariesDtoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dictionaryId,
      referencedTable: $db.dictionariesDto,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DictionariesDtoTableFilterComposer(
            $db: $db,
            $table: $db.dictionariesDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> wordProgressDtoRefs(
    Expression<bool> Function($$WordProgressDtoTableFilterComposer f) f,
  ) {
    final $$WordProgressDtoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.wordProgressDto,
      getReferencedColumn: (t) => t.wordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordProgressDtoTableFilterComposer(
            $db: $db,
            $table: $db.wordProgressDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WordsDtoTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsDtoTable> {
  $$WordsDtoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainWord => $composableBuilder(
    column: $table.mainWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translate => $composableBuilder(
    column: $table.translate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get example => $composableBuilder(
    column: $table.example,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationExample => $composableBuilder(
    column: $table.translationExample,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationDefinition => $composableBuilder(
    column: $table.translationDefinition,
    builder: (column) => ColumnOrderings(column),
  );

  $$DictionariesDtoTableOrderingComposer get dictionaryId {
    final $$DictionariesDtoTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dictionaryId,
      referencedTable: $db.dictionariesDto,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DictionariesDtoTableOrderingComposer(
            $db: $db,
            $table: $db.dictionariesDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordsDtoTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsDtoTable> {
  $$WordsDtoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mainWord =>
      $composableBuilder(column: $table.mainWord, builder: (column) => column);

  GeneratedColumn<String> get translate =>
      $composableBuilder(column: $table.translate, builder: (column) => column);

  GeneratedColumn<String> get example =>
      $composableBuilder(column: $table.example, builder: (column) => column);

  GeneratedColumn<String> get translationExample => $composableBuilder(
    column: $table.translationExample,
    builder: (column) => column,
  );

  GeneratedColumn<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get translationDefinition => $composableBuilder(
    column: $table.translationDefinition,
    builder: (column) => column,
  );

  $$DictionariesDtoTableAnnotationComposer get dictionaryId {
    final $$DictionariesDtoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dictionaryId,
      referencedTable: $db.dictionariesDto,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DictionariesDtoTableAnnotationComposer(
            $db: $db,
            $table: $db.dictionariesDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> wordProgressDtoRefs<T extends Object>(
    Expression<T> Function($$WordProgressDtoTableAnnotationComposer a) f,
  ) {
    final $$WordProgressDtoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.wordProgressDto,
      getReferencedColumn: (t) => t.wordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordProgressDtoTableAnnotationComposer(
            $db: $db,
            $table: $db.wordProgressDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WordsDtoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordsDtoTable,
          WordsDtoData,
          $$WordsDtoTableFilterComposer,
          $$WordsDtoTableOrderingComposer,
          $$WordsDtoTableAnnotationComposer,
          $$WordsDtoTableCreateCompanionBuilder,
          $$WordsDtoTableUpdateCompanionBuilder,
          (WordsDtoData, $$WordsDtoTableReferences),
          WordsDtoData,
          PrefetchHooks Function({bool dictionaryId, bool wordProgressDtoRefs})
        > {
  $$WordsDtoTableTableManager(_$AppDatabase db, $WordsDtoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$WordsDtoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$WordsDtoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$WordsDtoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> mainWord = const Value.absent(),
                Value<String> translate = const Value.absent(),
                Value<String?> example = const Value.absent(),
                Value<String?> translationExample = const Value.absent(),
                Value<String?> definition = const Value.absent(),
                Value<String?> translationDefinition = const Value.absent(),
                Value<int> dictionaryId = const Value.absent(),
              }) => WordsDtoCompanion(
                id: id,
                mainWord: mainWord,
                translate: translate,
                example: example,
                translationExample: translationExample,
                definition: definition,
                translationDefinition: translationDefinition,
                dictionaryId: dictionaryId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String mainWord,
                required String translate,
                Value<String?> example = const Value.absent(),
                Value<String?> translationExample = const Value.absent(),
                Value<String?> definition = const Value.absent(),
                Value<String?> translationDefinition = const Value.absent(),
                required int dictionaryId,
              }) => WordsDtoCompanion.insert(
                id: id,
                mainWord: mainWord,
                translate: translate,
                example: example,
                translationExample: translationExample,
                definition: definition,
                translationDefinition: translationDefinition,
                dictionaryId: dictionaryId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$WordsDtoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            dictionaryId = false,
            wordProgressDtoRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (wordProgressDtoRefs) db.wordProgressDto,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (dictionaryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.dictionaryId,
                            referencedTable: $$WordsDtoTableReferences
                                ._dictionaryIdTable(db),
                            referencedColumn:
                                $$WordsDtoTableReferences
                                    ._dictionaryIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (wordProgressDtoRefs)
                    await $_getPrefetchedData<
                      WordsDtoData,
                      $WordsDtoTable,
                      WordProgressDtoData
                    >(
                      currentTable: table,
                      referencedTable: $$WordsDtoTableReferences
                          ._wordProgressDtoRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$WordsDtoTableReferences(
                                db,
                                table,
                                p0,
                              ).wordProgressDtoRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.wordId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WordsDtoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordsDtoTable,
      WordsDtoData,
      $$WordsDtoTableFilterComposer,
      $$WordsDtoTableOrderingComposer,
      $$WordsDtoTableAnnotationComposer,
      $$WordsDtoTableCreateCompanionBuilder,
      $$WordsDtoTableUpdateCompanionBuilder,
      (WordsDtoData, $$WordsDtoTableReferences),
      WordsDtoData,
      PrefetchHooks Function({bool dictionaryId, bool wordProgressDtoRefs})
    >;
typedef $$WordProgressDtoTableCreateCompanionBuilder =
    WordProgressDtoCompanion Function({
      Value<int> id,
      required int wordId,
      Value<bool> isLearning,
    });
typedef $$WordProgressDtoTableUpdateCompanionBuilder =
    WordProgressDtoCompanion Function({
      Value<int> id,
      Value<int> wordId,
      Value<bool> isLearning,
    });

final class $$WordProgressDtoTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WordProgressDtoTable,
          WordProgressDtoData
        > {
  $$WordProgressDtoTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WordsDtoTable _wordIdTable(_$AppDatabase db) =>
      db.wordsDto.createAlias(
        $_aliasNameGenerator(db.wordProgressDto.wordId, db.wordsDto.id),
      );

  $$WordsDtoTableProcessedTableManager get wordId {
    final $_column = $_itemColumn<int>('word_id')!;

    final manager = $$WordsDtoTableTableManager(
      $_db,
      $_db.wordsDto,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WordProgressDtoTableFilterComposer
    extends Composer<_$AppDatabase, $WordProgressDtoTable> {
  $$WordProgressDtoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLearning => $composableBuilder(
    column: $table.isLearning,
    builder: (column) => ColumnFilters(column),
  );

  $$WordsDtoTableFilterComposer get wordId {
    final $$WordsDtoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordId,
      referencedTable: $db.wordsDto,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsDtoTableFilterComposer(
            $db: $db,
            $table: $db.wordsDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordProgressDtoTableOrderingComposer
    extends Composer<_$AppDatabase, $WordProgressDtoTable> {
  $$WordProgressDtoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLearning => $composableBuilder(
    column: $table.isLearning,
    builder: (column) => ColumnOrderings(column),
  );

  $$WordsDtoTableOrderingComposer get wordId {
    final $$WordsDtoTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordId,
      referencedTable: $db.wordsDto,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsDtoTableOrderingComposer(
            $db: $db,
            $table: $db.wordsDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordProgressDtoTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordProgressDtoTable> {
  $$WordProgressDtoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isLearning => $composableBuilder(
    column: $table.isLearning,
    builder: (column) => column,
  );

  $$WordsDtoTableAnnotationComposer get wordId {
    final $$WordsDtoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordId,
      referencedTable: $db.wordsDto,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsDtoTableAnnotationComposer(
            $db: $db,
            $table: $db.wordsDto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordProgressDtoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordProgressDtoTable,
          WordProgressDtoData,
          $$WordProgressDtoTableFilterComposer,
          $$WordProgressDtoTableOrderingComposer,
          $$WordProgressDtoTableAnnotationComposer,
          $$WordProgressDtoTableCreateCompanionBuilder,
          $$WordProgressDtoTableUpdateCompanionBuilder,
          (WordProgressDtoData, $$WordProgressDtoTableReferences),
          WordProgressDtoData,
          PrefetchHooks Function({bool wordId})
        > {
  $$WordProgressDtoTableTableManager(
    _$AppDatabase db,
    $WordProgressDtoTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$WordProgressDtoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$WordProgressDtoTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$WordProgressDtoTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> wordId = const Value.absent(),
                Value<bool> isLearning = const Value.absent(),
              }) => WordProgressDtoCompanion(
                id: id,
                wordId: wordId,
                isLearning: isLearning,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int wordId,
                Value<bool> isLearning = const Value.absent(),
              }) => WordProgressDtoCompanion.insert(
                id: id,
                wordId: wordId,
                isLearning: isLearning,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$WordProgressDtoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({wordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (wordId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.wordId,
                            referencedTable: $$WordProgressDtoTableReferences
                                ._wordIdTable(db),
                            referencedColumn:
                                $$WordProgressDtoTableReferences
                                    ._wordIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WordProgressDtoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordProgressDtoTable,
      WordProgressDtoData,
      $$WordProgressDtoTableFilterComposer,
      $$WordProgressDtoTableOrderingComposer,
      $$WordProgressDtoTableAnnotationComposer,
      $$WordProgressDtoTableCreateCompanionBuilder,
      $$WordProgressDtoTableUpdateCompanionBuilder,
      (WordProgressDtoData, $$WordProgressDtoTableReferences),
      WordProgressDtoData,
      PrefetchHooks Function({bool wordId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DictionariesDtoTableTableManager get dictionariesDto =>
      $$DictionariesDtoTableTableManager(_db, _db.dictionariesDto);
  $$WordsDtoTableTableManager get wordsDto =>
      $$WordsDtoTableTableManager(_db, _db.wordsDto);
  $$WordProgressDtoTableTableManager get wordProgressDto =>
      $$WordProgressDtoTableTableManager(_db, _db.wordProgressDto);
}
