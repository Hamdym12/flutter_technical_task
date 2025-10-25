import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_items_listview.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/view_switch_button.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';

class ExploreMapView extends StatelessWidget{
  const ExploreMapView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context,state) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image.asset(
              AppAssets.mapView,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: AppInsets.componentH20V20,
              child: GestureDetector(
                    onTap: ()=> context.read<SearchCubit>().toggleViewMapList(),
                    child: SvgPicture.asset(AppAssets.locationMark)
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child:Align(
               alignment: Alignment.bottomCenter,
               child: ViewSwitchButton(
                   viewType: state.viewType,
                   onTap: ()=> context.read<SearchCubit>().toggleViewType(),
               ),
              )
            ),
            if(state.isViewMapListFloated)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 255.h,
              child: const Align(
                alignment: Alignment.bottomCenter,
                  child: ExploreItemsListView(itemCount: 1,hasViewToggleButton: false)
              ),
            )
          ],
        );
      }
    );
  }
}
