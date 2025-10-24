import 'dart:convert';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/book_reservation_cubit/book_reservation_cubit.dart';

class CityPicker {
  static List<Map<String, dynamic>>? _cachedCities;

  /// parse JSON off the UI thread to avoid blocking the UI.
  static List<Map<String, dynamic>> _parseCities(String jsonString) {
    final map = json.decode(jsonString) as Map<String, dynamic>;
    final list = (map['saudi_cities'] as List).cast<Map>();
    return list.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  /// Load the cities from the assets.
  static Future<List<Map<String, dynamic>>> _loadCities() async {
    if (_cachedCities != null) return _cachedCities!;
    final jsonStr = await rootBundle.loadString(AppAssets.saudiCitiesJson);
    final parsed = await compute(_parseCities, jsonStr);
    _cachedCities = parsed;
    return parsed;
  }

  /// Shows the bottom-sheet dropdown and returns the chosen city (localized).
  static Future<void> show(BuildContext context) async {
    final cities = await _loadCities();
    final isArabic = context.locale.languageCode == 'ar';

    final items = cities
        .map<SelectedListItem<String>>(
          (c) => SelectedListItem<String>(
        data: isArabic ? (c['ar'] as String) : (c['en'] as String),
      ),
    ).toList();

     DropDownState(
      dropDown: DropDown<String>(
        data: items,
         dropDownBackgroundColor: AppColors.white,
        enableMultipleSelection: false, // single selection
        isSearchVisible: true,
        searchHintText: tr('Search'),
        searchFillColor: AppColors.gray50,
        bottomSheetTitle: Text(
          tr(LocaleKeys.city.tr()),
          style: AppTextStyles.baseMediumFont16Black500,
          textAlign: TextAlign.center,
        ),
        onSelected: (selectedItems) {
          if (selectedItems.isNotEmpty) {
            context.read<BookReservationCubit>().selectCity(selectedItems.first.data);
          }
        },
      ),
    ).showModal(context);
  }
}
