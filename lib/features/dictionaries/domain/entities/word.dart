class Word {
  Word({
    this.id,
    required this.dictionaryId,
    required this.mainWord,
    required this.translate,
    this.example,
    this.translationExample,
    this.definition,
    this.translationDefinition,
  });

  final int? id;
  final int dictionaryId;

  final String mainWord;
  final String translate;

  String? example;
  String? translationExample;

  String? definition;
  String? translationDefinition;

  Word copyWith({
    int? id,
    int? dictionaryId,
    String? mainWord,
    String? translate,
    String? example,
    String? translationExample,
    String? definition,
    String? translationDefinition,
  }) {
    return Word(
      id: id ?? this.id,
      dictionaryId: dictionaryId ?? this.dictionaryId,
      mainWord: mainWord ?? this.mainWord,
      translate: translate ?? this.translate,
      example: example ?? this.example,
      translationExample: translationExample ?? this.translationExample,
      definition: definition ?? this.definition,
      translationDefinition:
          translationDefinition ?? this.translationDefinition,
    );
  }
}
