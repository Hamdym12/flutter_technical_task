part of 'book_reservation_cubit.dart';

@immutable
class BookReservationState extends Equatable{
  final String? selectedCity;
  final String? selectedDateRange;
  final bool isDatePickerOpen;
  final bool isGuestPickerOpen;
  final int guestAdultCounter;
  final int guestChildCounter;
  const BookReservationState({this.guestAdultCounter = 0, this.guestChildCounter = 0, this.selectedCity, this.selectedDateRange,this.isDatePickerOpen=false,this.isGuestPickerOpen=false});
  @override
  List<Object?> get props => [selectedCity, selectedDateRange,isDatePickerOpen,isGuestPickerOpen,guestAdultCounter,guestChildCounter];

  BookReservationState copyWith({
    String? selectedCity,
    String? selectedDateRange,
    bool? isDatePickerOpen,
    bool? isGuestPickerOpen,
    int? guestAdultCounter,
    int? guestChildCounter,
  }) {
    return BookReservationState(
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDateRange: selectedDateRange ?? this.selectedDateRange,
      isDatePickerOpen:  isDatePickerOpen ?? this.isDatePickerOpen,
      isGuestPickerOpen: isGuestPickerOpen ?? this.isGuestPickerOpen,
      guestAdultCounter: guestAdultCounter ?? this.guestAdultCounter,
      guestChildCounter: guestChildCounter ?? this.guestChildCounter
    );
  }

}

class BookReservationInitial extends BookReservationState {
  const BookReservationInitial({super.selectedCity, super.selectedDateRange,super.isDatePickerOpen,super.isGuestPickerOpen,super.guestAdultCounter,super.guestChildCounter});
}