part of 'dictionary_overview_bloc.dart';

enum DictsOverviewStatus { initial, loading, success, failure }

enum DictsActionStatus { initial, loading, success, failure }

final class DictsOverviewState extends Equatable {
  const DictsOverviewState({
    this.status = DictsOverviewStatus.initial,
    this.actionStatus = DictsActionStatus.initial,
    this.dicts = const [],
    this.lastDeletedDict,
    this.error,
  });

  final DictsOverviewStatus status;
  final DictsActionStatus actionStatus;
  final List<Dictionary> dicts;
  final Dictionary? lastDeletedDict;
  final Object? error;

  DictsOverviewState copyWith({
    DictsOverviewStatus Function()? status,
    DictsActionStatus Function()? actionStatus,
    List<Dictionary> Function()? dicts,
    Dictionary Function()? lastDeletedDict,
    Object? Function()? error,
  }) => DictsOverviewState(
    status: status != null ? status() : this.status,
    actionStatus: actionStatus != null ? actionStatus() : this.actionStatus,
    dicts: dicts != null ? dicts() : this.dicts,
    lastDeletedDict:
        lastDeletedDict != null ? lastDeletedDict() : this.lastDeletedDict,
    error: error != null ? error() : this.error,
  );

  @override
  List<Object?> get props => [
    status,
    actionStatus,
    dicts,
    lastDeletedDict,
    error,
  ];
}
