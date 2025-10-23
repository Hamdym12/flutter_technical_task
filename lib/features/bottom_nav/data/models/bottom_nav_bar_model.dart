import 'package:flutter/material.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/features/explore/presentation/screens/explore_screen.dart';
import 'package:flutter_technical_task/features/inbox/presentation/screens/inbox_screen.dart';
import 'package:flutter_technical_task/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_technical_task/features/reservation/presentation/screens/reservation_screen.dart';
import 'package:flutter_technical_task/features/wishlist/presentation/screens/wishlist_screen.dart';

class BottomNavBarModel{
  final String svgPath;
  final String label;
  const BottomNavBarModel({
    required this.svgPath,
    required this.label
  });

  static const List<BottomNavBarModel> items = [
    BottomNavBarModel(
        svgPath: AppAssets.exploreSVG,
        label: LocaleKeys.bottom_nav_explore
    ),
    BottomNavBarModel(
        svgPath: AppAssets.bookingSVG,
        label: LocaleKeys.bottom_nav_reservation
    ),
    BottomNavBarModel(
        svgPath: AppAssets.wishlistSVG,
        label: LocaleKeys.bottom_nav_wishlist
    ),
    BottomNavBarModel(
        svgPath: AppAssets.inboxVG,
        label: LocaleKeys.bottom_nav_inbox
    ),
    BottomNavBarModel(
        svgPath: AppAssets.profileSVG,
        label: LocaleKeys.bottom_nav_profile
    ),
  ];

  static List<Widget> pages = [
    const ExploreScreen(),
    const ReservationScreen(),
    const WishlistScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];
}
