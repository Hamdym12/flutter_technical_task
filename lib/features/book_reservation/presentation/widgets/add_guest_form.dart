import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/enums/guest_type.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/basic_form_widget.dart';
import 'package:flutter_technical_task/core/widgets/custom_animated_switcher_transition.dart';
import 'package:flutter_technical_task/features/book_reservation/data/models/add_guest_data_model.dart';
import 'package:flutter_technical_task/features/book_reservation/presentation/cubit/book_reservation_cubit.dart';

class AddGuestForm extends StatelessWidget {
  const AddGuestForm({super.key});
  @override
  Widget build(BuildContext context) {
  return BlocBuilder<BookReservationCubit, BookReservationState>(
   builder: (context, state) {
    return Column(
      children: [
        BasicFormWidget(
          title: LocaleKeys.guest.tr(),
          onTap: ()=> context.read<BookReservationCubit>().toggleGuestPicker(),
          suffix: Padding(
            padding: AppInsets.basicFormInput12H,
            child: Row(
              spacing: 6.w,
              children: [
                for(int i=0;i<2;i++)
                  GestureDetector(
                    onTap: ()=> HapticFeedback.lightImpact(),
                    child: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppRadius.basicFormInput8),
                          border: Border.all(color: AppColors.borderLightGrey),
                          boxShadow: AppShadows.dropShadowSm
                      ),
                      child: Center(
                        child: Icon(
                          i==0 ? CupertinoIcons.minus :
                          CupertinoIcons.add,
                          color: AppColors.titleDeepGray,
                          size: 16,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:4.h),
          child: CustomAnimatedSwitcherTransition(
            isOpen: state.isGuestPickerOpen,
            valueKey: 'guest_picker',
            child: BlocBuilder<BookReservationCubit, BookReservationState>(
            builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                Text(
                  "Add Guest",
                  style: AppTextStyles.font18DeepGray500
                ),
                _buildGuestTypeTile(context: context, guestType: GuestType.adult),
                Divider(height: 12.h,thickness: 1,color: AppColors.borderLightGrey),
                _buildGuestTypeTile(context: context, guestType: GuestType.children),
              ],
            );
            },
          )
          ),
        )
      ],
    );
  },
 );
  }

  Widget _buildGuestTypeTile({required BuildContext context,required GuestType guestType}){
    final guest = AddGuestDataModel.data;
    final cubit = context.read<BookReservationCubit>();
    return ListTile(
        minTileHeight: 40.h,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          guest[guestType]!.title,
          style: AppTextStyles.font16TitleDeepGray400,
        ),
        subtitle: Text(
          guest[guestType]!.subTitle,
          style: AppTextStyles.font12PrimaryPurple400.copyWith(
              color: AppColors.placeHolderShadowGray
          ),
        ),
        trailing: BlocBuilder<BookReservationCubit, BookReservationState>(
        builder: (context, state) {
          return ConstrainedBox(
           constraints: BoxConstraints(maxWidth: 200.w),
           child: Row(
             mainAxisSize: MainAxisSize.min,
             spacing: 12.w,
             children: [
               _buildButton(
                   context,
                   isMinus: true,
                   onTap: () {
                     if (state.guestAdultCounter > 0 && guestType == GuestType.adult) {
                       cubit.decrementAdultCounter();
                     }else if (state.guestChildCounter > 0 && guestType == GuestType.children){
                       cubit.decrementChildCounter();
                     }
                   }
               ),
               ConstrainedBox(
                 constraints: BoxConstraints(
                     maxWidth: 80.w,
                     minWidth: 12.h
                 ),
                 child: Text(
                   guestType == GuestType.adult ?
                   state.guestAdultCounter.toString():
                   state.guestChildCounter.toString(),
                   style: AppTextStyles.baseMediumFont16Black500
                       .copyWith(
                       color: AppColors.titleDeepGray
                   ),
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),
               ),
               _buildButton(
                   context,
                   onTap: () {
                     HapticFeedback.lightImpact();
                     guestType == GuestType.adult ?
                     cubit.incrementAdultCounter() :
                     cubit.incrementChildCounter();
                   }
               )
             ],
           )
          );
        }
        )
    );
  }

  Widget _buildButton(BuildContext context,{Function()? onTap,bool isMinus=false}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.borderLightGrey),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isMinus ? CupertinoIcons.minus :
            CupertinoIcons.add,
            color: AppColors.titleDeepGray,
            size: 20,
          ),
        ),
      ),
    );
  }
}
