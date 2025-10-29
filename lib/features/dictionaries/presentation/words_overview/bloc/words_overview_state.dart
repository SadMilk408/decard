part of 'words_overview_bloc.dart';

enum WordsOverviewStatus { initial, loading, success, failure }

enum WordsOverviewActionStatus { initial, loading, success, failure }

final class WordsOverviewState extends Equatable {
  const WordsOverviewState({
    this.overviewStatus = WordsOverviewStatus.initial,
    this.actionStatus = WordsOverviewActionStatus.initial,
    this.words = const [],
    this.error,
    this.lastDeletedWord,
  });

  final WordsOverviewStatus overviewStatus;
  final WordsOverviewActionStatus actionStatus;
  final List<Word> words;
  final Object? error;
  final Word? lastDeletedWord;

  WordsOverviewState copyWith({
    WordsOverviewStatus Function()? overviewStatus,
    WordsOverviewActionStatus Function()? actionStatus,
    List<Word> Function()? words,
    Object? Function()? error,
    Word? Function()? lastDeletedWord,
  }) => WordsOverviewState(
    overviewStatus:
        overviewStatus != null ? overviewStatus() : this.overviewStatus,
    actionStatus: actionStatus != null ? actionStatus() : this.actionStatus,
    words: words != null ? words() : this.words,
    error: error != null ? error() : this.error,
    lastDeletedWord:
        lastDeletedWord != null ? lastDeletedWord() : this.lastDeletedWord,
  );

  @override
  List<Object?> get props => [
    overviewStatus,
    actionStatus,
    words,
    error,
    lastDeletedWord,
  ];
}
