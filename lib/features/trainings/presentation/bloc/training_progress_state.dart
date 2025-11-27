part of 'training_progress_bloc.dart';

final class TrainingProgressState extends Equatable {
  const TrainingProgressState({
    required this.words,
    required this.easyCount,
    required this.againCount,
  });

  final List<Word> words;
  final int easyCount;
  final int againCount;

  TrainingProgressState copyWith({
    List<Word>? words,
    int? easyCount,
    int? againCount,
  }) => TrainingProgressState(
    words: words ?? this.words,
    easyCount: easyCount ?? this.easyCount,
    againCount: againCount ?? this.againCount,
  );

  @override
  List<Object?> get props => [words, easyCount, againCount];
}

final class TrainingProgressInitial extends TrainingProgressState {
  const TrainingProgressInitial()
    : super(words: const [], easyCount: 0, againCount: 0);
}

final class TrainingProgressLoading extends TrainingProgressState {
  const TrainingProgressLoading()
    : super(words: const [], easyCount: 0, againCount: 0);
}

final class TrainingProgressSuccess extends TrainingProgressState {
  const TrainingProgressSuccess({
    required super.words,
    required super.easyCount,
    required super.againCount,
  });

  @override
  List<Object?> get props => [words, easyCount, againCount];
}

final class TrainingProgressFailure extends TrainingProgressState {
  const TrainingProgressFailure({required this.error, required this.message})
    : super(words: const [], easyCount: 0, againCount: 0);

  final Object error;
  final String message;

  @override
  List<Object?> get props => [words, easyCount, againCount, error, message];
}
