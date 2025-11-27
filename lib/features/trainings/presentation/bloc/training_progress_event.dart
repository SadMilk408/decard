part of 'training_progress_bloc.dart';

sealed class TrainingProgressEvent extends Equatable {
  const TrainingProgressEvent();

  @override
  List<Object?> get props => [];
}

final class TrainingStarted extends TrainingProgressEvent {
  const TrainingStarted({required this.words});

  final List<Word> words;

  @override
  List<Object?> get props => [words];
}

final class TrainingProgressEasyIncremented extends TrainingProgressEvent {
  const TrainingProgressEasyIncremented({required this.wordId});

  final int wordId;

  @override
  List<Object?> get props => [wordId];
}

final class TrainingProgressAgainIncremented extends TrainingProgressEvent {
  const TrainingProgressAgainIncremented({required this.wordId});

  final int wordId;

  @override
  List<Object?> get props => [wordId];
}

final class TrainingProgressReset extends TrainingProgressEvent {
  const TrainingProgressReset();
}
