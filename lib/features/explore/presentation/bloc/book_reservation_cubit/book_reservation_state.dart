part of 'book_reservation_cubit.dart';

@immutable
class BookReservationState extends Equatable{
  final String? selectedCity;
  final String? selectedDateRange;
  final bool isDatePickerOpen;
  const BookReservationState({this.selectedCity, this.selectedDateRange,this.isDatePickerOpen=false});
  @override
  List<Object?> get props => [selectedCity, selectedDateRange,isDatePickerOpen];

  BookReservationState copyWith({
    String? selectedCity,
    String? selectedDateRange,
    bool? isDatePickerOpen,
  }) {
    return BookReservationState(
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDateRange: selectedDateRange ?? this.selectedDateRange,
      isDatePickerOpen: isDatePickerOpen ?? this.isDatePickerOpen,
    );
  }

}

class BookReservationInitial extends BookReservationState {
  const BookReservationInitial({super.selectedCity, super.selectedDateRange,super.isDatePickerOpen});
}