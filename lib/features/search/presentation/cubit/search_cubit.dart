import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_technical_task/core/enums/view_type.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchInitialState());

  void selectCity(String city) => emit(state.copyWith(selectedCity: city));

  void selectDateRange({String? dateRange}) => emit(state.copyWith(selectedDateRange: dateRange));

  void toggleDataPicker() => emit(state.copyWith(isDatePickerOpen: !state.isDatePickerOpen));

  void toggleGuestPicker() => emit(state.copyWith(isGuestPickerOpen: !state.isGuestPickerOpen));

  void incrementAdultCounter()=> emit(state.copyWith(guestAdultCounter: state.guestAdultCounter+1));

  void decrementAdultCounter()=> emit(state.copyWith(guestAdultCounter: state.guestAdultCounter-1));

  void incrementChildCounter()=> emit(state.copyWith(guestChildCounter: state.guestChildCounter+1));

  void decrementChildCounter() => emit(state.copyWith(guestChildCounter: state.guestChildCounter-1));

  void resetGuests()=> emit(state.copyWith(guestAdultCounter: 0, guestChildCounter: 0));

  void toggleViewType()=> emit(state.copyWith(viewType: state.viewType == ViewType.map ? ViewType.list : ViewType.map));

  void selectCategory(String category) => emit(state.copyWith(selectedCategory: category));


}
