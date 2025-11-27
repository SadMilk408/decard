import 'package:english_training_app/features/trainings/data/repositories/word_progress_repository_impl.dart';
import 'package:english_training_app/features/words/domain/entities/word.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'training_progress_event.dart';
part 'training_progress_state.dart';

class TrainingProgressBloc
    extends Bloc<TrainingProgressEvent, TrainingProgressState> {
  TrainingProgressBloc({required WordProgressRepository wordProgressRepository})
    : _wordProgressRepository = wordProgressRepository,
      super(const TrainingProgressInitial()) {
    on<TrainingStarted>(_onTrainingStarted);
    on<TrainingProgressAgainIncremented>(_onAgain);
    on<TrainingProgressEasyIncremented>(_onEasy);
    on<TrainingProgressReset>(_onReset);
  }

  final WordProgressRepository _wordProgressRepository;

  void _onTrainingStarted(
    TrainingStarted event,
    Emitter<TrainingProgressState> emit,
  ) async {
    emit(const TrainingProgressLoading());

    try {
      final wordsForTraining = await _wordProgressRepository
          .getWordsForTraining(event.words);

      final stats = await _wordProgressRepository.getTrainingStats(event.words);

      emit(
        TrainingProgressSuccess(
          words: wordsForTraining,
          againCount: stats.learningCount,
          easyCount: stats.learnedCount,
        ),
      );
    } catch (e) {
      emit(
        TrainingProgressFailure(
          error: e,
          message: 'Error getting words for training',
        ),
      );
    }
  }

  void _onAgain(
    TrainingProgressAgainIncremented event,
    Emitter<TrainingProgressState> emit,
  ) {
    try {
      _wordProgressRepository.setIsLearning(
        wordId: event.wordId,
        isLearning: true,
      );
    } catch (e) {
      emit(
        TrainingProgressFailure(
          error: e,
          message: 'Error setting word progress',
        ),
      );
    }

    emit(
      TrainingProgressSuccess(
        words: state.words,
        easyCount: state.easyCount,
        againCount: state.againCount + 1,
      ),
    );
  }

  void _onEasy(
    TrainingProgressEasyIncremented event,
    Emitter<TrainingProgressState> emit,
  ) {
    try {
      _wordProgressRepository.setIsLearning(
        wordId: event.wordId,
        isLearning: false,
      );

      emit(
        TrainingProgressSuccess(
          words: state.words,
          easyCount: state.easyCount + 1,
          againCount: state.againCount,
        ),
      );
    } catch (e) {
      emit(
        TrainingProgressFailure(
          error: e,
          message: 'Error setting word progress',
        ),
      );
    }
  }

  void _onReset(
    TrainingProgressReset event,
    Emitter<TrainingProgressState> emit,
  ) {
    _wordProgressRepository.deleteAllWordsProgress();
    emit(TrainingProgressInitial());
  }
}
