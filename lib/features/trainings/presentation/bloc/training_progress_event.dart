part of 'training_progress_bloc.dart';

sealed class TrainingProgressEvent extends Equatable {
  const TrainingProgressEvent();

  @override
  List<Object?> get props => [];
}

final class TrainingProgressEasyIncremented extends TrainingProgressEvent {
  const TrainingProgressEasyIncremented();
}

final class TrainingProgressAgainIncremented extends TrainingProgressEvent {
  const TrainingProgressAgainIncremented();
}

final class TrainingProgressReset extends TrainingProgressEvent {
  const TrainingProgressReset();
}
