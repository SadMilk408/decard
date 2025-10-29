part of 'dictionary_overview_bloc.dart';

sealed class DictsOverviewEvent extends Equatable {
  const DictsOverviewEvent();

  @override
  List<Object> get props => [];
}

final class DictsOverviewSubscriptionRequested extends DictsOverviewEvent {
  const DictsOverviewSubscriptionRequested();
}

final class DictAddRequested extends DictsOverviewEvent {
  const DictAddRequested({required this.title});
  final String title;
}

final class DictRenameRequested extends DictsOverviewEvent {
  const DictRenameRequested({required this.id, required this.newTitle});
  final int id;
  final String newTitle;
}

final class DictDeleteRequested extends DictsOverviewEvent {
  const DictDeleteRequested({required this.id});
  final int id;
}

final class DictUndoDeleteRequested extends DictsOverviewEvent {
  const DictUndoDeleteRequested();
}
