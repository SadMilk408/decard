part of 'training_progress_bloc.dart';

final class TrainingProgressState extends Equatable {
  const TrainingProgressState({
    required this.easyCount,
    required this.againCount,
  });

  final int easyCount;
  final int againCount;

  TrainingProgressState copyWith({int? easyCount, int? againCount}) =>
      TrainingProgressState(
        easyCount: easyCount ?? this.easyCount,
        againCount: againCount ?? this.againCount,
      );

  @override
  List<Object?> get props => [easyCount, againCount];
}
