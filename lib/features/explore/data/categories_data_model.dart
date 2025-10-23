import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';

class CategoriesDataModel{
  final String svgPath;
  final String label;

  const CategoriesDataModel({
    required this.svgPath,
    required this.label
  });

  static const List<CategoriesDataModel> items = [
    CategoriesDataModel(
        svgPath: AppAssets.flexible,
        label: LocaleKeys.categories_flexible
    ),
    CategoriesDataModel(
      svgPath: AppAssets.camelRidingSvg,
      label: LocaleKeys.categories_camel_riding
    ),
    CategoriesDataModel(
        svgPath: AppAssets.cookingClassSvg,
        label: LocaleKeys.categories_cooking_class
    ),
    CategoriesDataModel(
        svgPath: AppAssets.hennaArtSvg,
        label: LocaleKeys.categories_henna_art
    ),
    CategoriesDataModel(
        svgPath: AppAssets.coffeeBrewingSvg,
        label: LocaleKeys.categories_coffee_brewing
    ),
    CategoriesDataModel(
        svgPath: AppAssets.foodToursSvg,
        label: LocaleKeys.categories_food_tours
    ),
  ];
}