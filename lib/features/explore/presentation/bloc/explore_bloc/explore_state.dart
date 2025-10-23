part of 'explore_bloc.dart';

@immutable
sealed class ExploreState extends Equatable{
  const ExploreState();
  @override
  List<Object?> get props => [];
}

final class ExploreInitial extends ExploreState {}

final class ExploreSearchActive extends ExploreState{}
