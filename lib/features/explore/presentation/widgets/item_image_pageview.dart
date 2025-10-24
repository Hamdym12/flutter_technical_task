import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemImagePageview extends StatefulWidget {
  const ItemImagePageview({super.key, required this.listIndex});
  final int listIndex;

  @override
  State<ItemImagePageview> createState() => _ItemImagePageviewState();
}

class _ItemImagePageviewState extends State<ItemImagePageview> {
  final _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<String> simulatedImages = [
    AppAssets.horseRidingPng,
    AppAssets.camelRidingPng,
    AppAssets.horseRidingPng,
    AppAssets.camelRidingPng,
    AppAssets.horseRidingPng,
    AppAssets.camelRidingPng,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 334.h,
          child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context,index){
                return Image.asset(
                  widget.listIndex == 0?
                  simulatedImages[index]:
                  simulatedImages[index].replaceFirst(
                    AppAssets.horseRidingPng, AppAssets.camelRidingPng
                  ),
                  height: 334.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              }
          ),
        ),
        Positioned(
            bottom: 16.h,
            top: 0,
            child:Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                  controller: _pageController,
                  count:  5,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing: 5.w,
                      radius:  4.0,
                      dotWidth:  6.w,
                      dotHeight:  6.h,
                      paintStyle:  PaintingStyle.fill,
                      dotColor:  AppColors.neutral03,
                      activeDotColor: AppColors.white
                  ),
                  onDotClicked:(page){
                    _pageController.animateToPage(
                        page,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn
                    );
                  }
              ),
            )
        )
      ],
    );
  }
}
