import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchInitialState());

  void selectCity(String city) => emit(state.copyWith(selectedCity: city));

  void selectDateRange({required String dateRange}) => emit(state.copyWith(selectedDateRange: dateRange));

  void toggleDataPicker() => emit(state.copyWith(isDatePickerOpen: !state.isDatePickerOpen));

  void toggleGuestPicker() => emit(state.copyWith(isGuestPickerOpen: !state.isGuestPickerOpen));

  void incrementAdultCounter()=> emit(state.copyWith(guestAdultCounter: state.guestAdultCounter+1));

  void decrementAdultCounter()=> emit(state.copyWith(guestAdultCounter: state.guestAdultCounter-1));

  void incrementChildCounter()=> emit(state.copyWith(guestChildCounter: state.guestChildCounter+1));

  void decrementChildCounter() => emit(state.copyWith(guestChildCounter: state.guestChildCounter-1));
}
