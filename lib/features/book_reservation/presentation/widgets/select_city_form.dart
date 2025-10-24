import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_task/core/widgets/basic_form_widget.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/widgets/city_picker.dart';
import 'package:flutter_technical_task/features/book_reservation/presentation/cubit/book_reservation_cubit.dart';

class SelectCityForm extends StatelessWidget {
  const SelectCityForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookReservationCubit, BookReservationState>(
      builder: (context, state) {
        return BasicFormWidget(
          title: state.selectedCity ?? LocaleKeys.city.tr(),
          onTap: () async => await CityPicker.show(context),
        );
      },
    );
  }
}
