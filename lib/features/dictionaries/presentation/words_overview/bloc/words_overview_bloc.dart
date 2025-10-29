import 'package:english_training_app/features/dictionaries/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'words_overview_event.dart';
part 'words_overview_state.dart';

class WordsOverviewBloc extends Bloc<WordsOverviewEvent, WordsOverviewState> {
  WordsOverviewBloc({required WordsRepository wordsRepository})
    : _wordsRepository = wordsRepository,
      super(const WordsOverviewState()) {
    on<WordsOverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<WordsOverviewAddWordRequested>(_onWordAddRequested);
    on<WordsOverviewUpdateWordRequested>(_onWordUpdateRequested);
    on<WordsOverviewDeleteWordRequested>(_onWordDeleteRequested);
    on<WordsOverviewUndoDeleteWordRequested>(_onWordUndoDeleteRequested);
  }

  final WordsRepository _wordsRepository;

  Future<void> _onSubscriptionRequested(
    WordsOverviewSubscriptionRequested event,
    Emitter<WordsOverviewState> emit,
  ) async {
    emit(state.copyWith(overviewStatus: () => WordsOverviewStatus.loading));

    await emit.forEach<List<Word>>(
      _wordsRepository.watchWordsByDictId(event.dictionaryId),
      onData:
          (words) => state.copyWith(
            overviewStatus: () => WordsOverviewStatus.success,
            words: () => words,
          ),
      onError:
          (error, stackTrace) => state.copyWith(
            overviewStatus: () => WordsOverviewStatus.failure,
            error: () => error,
          ),
    );
  }

  Future<void> _onWordAddRequested(
    WordsOverviewAddWordRequested event,
    Emitter<WordsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => WordsOverviewActionStatus.loading));

    try {
      await _wordsRepository.saveWord(event.word);

      emit(
        state.copyWith(actionStatus: () => WordsOverviewActionStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => WordsOverviewActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }

  Future<void> _onWordUpdateRequested(
    WordsOverviewUpdateWordRequested event,
    Emitter<WordsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => WordsOverviewActionStatus.loading));

    try {
      await _wordsRepository.updateWord(event.word);
      emit(
        state.copyWith(actionStatus: () => WordsOverviewActionStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => WordsOverviewActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }

  Future<void> _onWordDeleteRequested(
    WordsOverviewDeleteWordRequested event,
    Emitter<WordsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => WordsOverviewActionStatus.loading));

    try {
      await _wordsRepository.deleteWordById(event.word.id!);
      emit(
        state.copyWith(actionStatus: () => WordsOverviewActionStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => WordsOverviewActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }

  Future<void> _onWordUndoDeleteRequested(
    WordsOverviewUndoDeleteWordRequested event,
    Emitter<WordsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => WordsOverviewActionStatus.loading));

    try {
      await _wordsRepository.saveWord(event.word);
      emit(
        state.copyWith(actionStatus: () => WordsOverviewActionStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => WordsOverviewActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }
}
