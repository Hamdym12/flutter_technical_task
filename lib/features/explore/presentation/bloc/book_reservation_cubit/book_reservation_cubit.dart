import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'book_reservation_state.dart';

@lazySingleton
class BookReservationCubit extends Cubit<BookReservationState> {
  BookReservationCubit() : super(const BookReservationInitial());

  void selectCity(String city) => emit(state.copyWith(selectedCity: city));

  void selectDate(String date)=> emit(state.copyWith(selectedDate: date));
}
