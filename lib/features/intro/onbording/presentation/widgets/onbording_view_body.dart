import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/features/intro/onbording/data/model/onbording_model.dart';
import 'package:cure/features/intro/onbording/presentation/widgets/button_next.dart';
import 'package:cure/features/intro/onbording/presentation/widgets/button_skip.dart';
import 'package:cure/features/intro/onbording/presentation/widgets/onbording_item.dart';

class OnbordingViewBody extends StatefulWidget {
  const OnbordingViewBody({super.key});

  @override
  State<OnbordingViewBody> createState() => _OnbordingViewBodyState();
}

class _OnbordingViewBodyState extends State<OnbordingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          16.hs,
          Align(
            alignment: Alignment.centerRight,
            child: ButtonSkip(
              currentPage: currentPage,
              pageController: pageController,
            ),
          ),
          16.hs,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: OnbordingModel.onbordingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) => OnbordingItem(
                item: OnbordingModel.onbordingList[index],
                pageController: pageController,
              ),
            ),
          ),
          ButtonNext(currentPage: currentPage),
          42.hs,
        ],
      ),
    );
  }
}
