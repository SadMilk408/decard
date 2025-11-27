class WordFormData {
  final int dictionaryId;
  final String mainWord;
  final String translate;
  final String? example;
  final String? translationExample;
  final String? definition;
  final String? translationDefinition;

  WordFormData({
    required this.dictionaryId,
    required this.mainWord,
    required this.translate,
    this.example,
    this.translationExample,
    this.definition,
    this.translationDefinition,
  });
}
