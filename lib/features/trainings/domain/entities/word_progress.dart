import 'package:english_training_app/features/words/domain/entities/word.dart';

class WordProgress {
  final Word word;
  final bool isNeedToRepeate;

  WordProgress({required this.word, required this.isNeedToRepeate});
}
