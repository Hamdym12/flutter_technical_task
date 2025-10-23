import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreSearchOpened>((event, emit) {
      emit(ExploreSearchActive());
    });
    on<ExploreSearchClosed>((event, emit) {
      emit(ExploreInitial());
    });
  }
}
