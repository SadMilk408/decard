part of 'words_overview_bloc.dart';

sealed class WordsOverviewEvent extends Equatable {
  const WordsOverviewEvent();

  @override
  List<Object> get props => [];
}

final class WordsOverviewSubscriptionRequested extends WordsOverviewEvent {
  const WordsOverviewSubscriptionRequested({required this.dictionaryId});

  final int dictionaryId;
}

final class WordsOverviewAddWordRequested extends WordsOverviewEvent {
  const WordsOverviewAddWordRequested({required this.word});
  final WordFormData word;
}

final class WordsOverviewUpdateWordRequested extends WordsOverviewEvent {
  const WordsOverviewUpdateWordRequested({required this.word});
  final WordFormData word;
}

final class WordsOverviewDeleteWordRequested extends WordsOverviewEvent {
  const WordsOverviewDeleteWordRequested({required this.wordId});
  final int wordId;
}

final class WordsOverviewUndoDeleteWordRequested extends WordsOverviewEvent {
  const WordsOverviewUndoDeleteWordRequested({required this.word});
  final WordFormData word;
}
