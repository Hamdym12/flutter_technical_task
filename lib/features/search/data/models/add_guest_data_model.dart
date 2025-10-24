import 'package:flutter_technical_task/core/enums/guest_type.dart';

class AddGuestDataModel {
  final String title;
  final String subTitle;

  AddGuestDataModel({required this.title, required this.subTitle});

  static final Map<GuestType, AddGuestDataModel> data = {
    GuestType.adult: AddGuestDataModel(
      title: 'Adults',
      subTitle: 'Ages 13 or above',
    ),
    GuestType.children: AddGuestDataModel(
      title: 'Children',
      subTitle: 'Ages 3 or below',
    ),
  };
}
