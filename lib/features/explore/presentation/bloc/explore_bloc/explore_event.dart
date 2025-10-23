part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent {}

class ExploreSearchOpened extends ExploreEvent{}

class ExploreSearchClosed extends ExploreEvent {}