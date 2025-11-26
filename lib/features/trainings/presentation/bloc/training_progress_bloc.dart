import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'training_progress_event.dart';
part 'training_progress_state.dart';

class TrainingProgressBloc
    extends Bloc<TrainingProgressEvent, TrainingProgressState> {
  TrainingProgressBloc()
    : super(const TrainingProgressState(easyCount: 0, againCount: 0)) {
    on<TrainingProgressAgainIncremented>(_onAgain);
    on<TrainingProgressEasyIncremented>(_onEasy);
    on<TrainingProgressReset>(_onReset);
  }

  void _onAgain(
    TrainingProgressAgainIncremented event,
    Emitter<TrainingProgressState> emit,
  ) {
    emit(state.copyWith(againCount: state.againCount + 1));
  }

  void _onEasy(
    TrainingProgressEasyIncremented event,
    Emitter<TrainingProgressState> emit,
  ) {
    emit(state.copyWith(easyCount: state.easyCount + 1));
  }

  void _onReset(
    TrainingProgressReset event,
    Emitter<TrainingProgressState> emit,
  ) {
    emit(const TrainingProgressState(easyCount: 0, againCount: 0));
  }
}
