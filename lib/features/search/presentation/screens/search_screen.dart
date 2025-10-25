import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/search_history.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/search_inputs_forms.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/submit_search_widget.dart';

@RoutePage(name:'SearchScreenRoute')
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SearchAppBar(
       isSearchActive: true,
       onTap: (){},
       readOnly: false
      ),
      body: BlocProvider(
        create: (context)=>SearchCubit(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   BlocBuilder<SearchCubit, SearchState>(
                     builder: (context,state) {
                       return SearchInputsForms(
                        searchCubit: context.read<SearchCubit>(),
                        );
                     }
                   ),
                    Divider(
                      color: AppColors.borderLightGrey,
                      thickness: 1,
                      height: 24.h,
                    ),
                    SizedBox(height: 4.h),
                    const SearchHistory()
                 ],
                )
              ),
            ),
            const SubmitSearchWidget()
          ],
        ).animate()
            .fadeIn(
          duration: 400.ms,
          curve: Curves.easeOutCubic
        ).slideY(
          begin: 0.04,
          duration: 400.ms,
          curve: Curves.easeOutCubic
        ),
      ),
    );
  }
}
