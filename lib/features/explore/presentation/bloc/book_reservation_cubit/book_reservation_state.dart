part of 'book_reservation_cubit.dart';

@immutable
class BookReservationState extends Equatable{
  final String? selectedCity;
  final String? selectedDate;
  const BookReservationState({this.selectedCity, this.selectedDate});
  @override
  List<Object?> get props => [selectedCity, selectedDate];

  BookReservationState copyWith({
    String? selectedCity,
    String? selectedDate,
  }) {
    return BookReservationState(
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

}

class BookReservationInitial extends BookReservationState {
  const BookReservationInitial({super.selectedCity, super.selectedDate});
}