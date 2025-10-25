import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/helpers/toast_helper.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/routing/app_router.gr.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';

class SubmitSearchWidget extends StatelessWidget {
  const SubmitSearchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      padding: AppInsets.componentH20V20,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
            top: BorderSide(
                color: AppColors.borderLightGrey,width: 1
            ))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutlinedButton(
              onPressed: ()=>context.maybePop(),
              child: Text(LocaleKeys.cancel.tr())
          ),
          BlocBuilder<SearchCubit,SearchState>(
           builder: (context,state) {
             return ElevatedButton(
                 onPressed: (){
                   final cubit = context.read<SearchCubit>();
                   if(state.selectedCity != null && state.selectedDateRange != null){
                     context.router.push(
                       SearchResultScreenRoute(
                        searchCubit: cubit,
                      ),
                     );
                   }else{
                     showToast(message: 'Please Complete The Required Fields');
                   }
                 },
                 child: Text(LocaleKeys.search_hint.tr())
             );
           }
          ),
        ],
      ),
    );
  }
}
