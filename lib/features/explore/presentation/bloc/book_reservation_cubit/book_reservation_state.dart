part of 'book_reservation_cubit.dart';

@immutable
class BookReservationState extends Equatable{
  final String? selectedCity;
  final String? selectedDateRange;
  final bool isDatePickerOpen;
  final bool isGuestPickerOpen;
  const BookReservationState({this.selectedCity, this.selectedDateRange,this.isDatePickerOpen=false,this.isGuestPickerOpen=false});
  @override
  List<Object?> get props => [selectedCity, selectedDateRange,isDatePickerOpen,isGuestPickerOpen];

  BookReservationState copyWith({
    String? selectedCity,
    String? selectedDateRange,
    bool? isDatePickerOpen,
    bool? isGuestPickerOpen,
  }) {
    return BookReservationState(
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDateRange: selectedDateRange ?? this.selectedDateRange,
      isDatePickerOpen: isDatePickerOpen ?? this.isDatePickerOpen,
      isGuestPickerOpen: isGuestPickerOpen ?? this.isGuestPickerOpen,
    );
  }

}

class BookReservationInitial extends BookReservationState {
  const BookReservationInitial({super.selectedCity, super.selectedDateRange,super.isDatePickerOpen,super.isGuestPickerOpen});
}