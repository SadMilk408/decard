import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:english_training_app/features/dictionaries/domain/repositories/dictionary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dictionary_overview_event.dart';
part 'dictionary_overview_state.dart';

class DictsOverviewBloc extends Bloc<DictsOverviewEvent, DictsOverviewState> {
  DictsOverviewBloc({required DictRepository dictRepository})
    : _dictRepository = dictRepository,
      super(const DictsOverviewState()) {
    on<DictsOverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<DictAddRequested>(_onDictAddRequested);
    on<DictRenameRequested>(_onDictRenameRequested);
    on<DictDeleteRequested>(_onDictDeleteRequested);
    on<DictUndoDeleteRequested>(_onDictUndoDeleteRequested);
  }

  final DictRepository _dictRepository;

  Future<void> _onSubscriptionRequested(
    DictsOverviewSubscriptionRequested event,
    Emitter<DictsOverviewState> emit,
  ) async {
    emit(state.copyWith(status: () => DictsOverviewStatus.loading));

    await emit.forEach<List<Dictionary>>(
      _dictRepository.watchDicts(),
      onData:
          (dictionaries) => state.copyWith(
            status: () => DictsOverviewStatus.success,
            dicts: () => dictionaries,
          ),
      onError:
          (error, stackTrace) => state.copyWith(
            status: () => DictsOverviewStatus.failure,
            error: () => error,
          ),
    );
  }

  Future<void> _onDictAddRequested(
    DictAddRequested event,
    Emitter<DictsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => DictsActionStatus.loading));

    try {
      await _dictRepository.saveDict(Dictionary(title: event.title));

      emit(state.copyWith(actionStatus: () => DictsActionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => DictsActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }

  Future<void> _onDictRenameRequested(
    DictRenameRequested event,
    Emitter<DictsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => DictsActionStatus.loading));

    try {
      await _dictRepository.updateDict(
        Dictionary(id: event.id, title: event.newTitle),
      );

      emit(state.copyWith(actionStatus: () => DictsActionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => DictsActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }

  Future<void> _onDictDeleteRequested(
    DictDeleteRequested event,
    Emitter<DictsOverviewState> emit,
  ) async {
    emit(state.copyWith(actionStatus: () => DictsActionStatus.loading));

    try {
      final toDelete = await _dictRepository.deleteDictById(event.id);

      emit(
        state.copyWith(
          actionStatus: () => DictsActionStatus.success,
          lastDeletedDict: () => toDelete,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => DictsActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }

  Future<void> _onDictUndoDeleteRequested(
    DictUndoDeleteRequested event,
    Emitter<DictsOverviewState> emit,
  ) async {
    final last = state.lastDeletedDict;

    if (last == null) {
      return;
    }

    emit(state.copyWith(actionStatus: () => DictsActionStatus.loading));

    try {
      await _dictRepository.saveDict(last);

      emit(state.copyWith(actionStatus: () => DictsActionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          actionStatus: () => DictsActionStatus.failure,
          error: () => e,
        ),
      );
    }
  }
}
