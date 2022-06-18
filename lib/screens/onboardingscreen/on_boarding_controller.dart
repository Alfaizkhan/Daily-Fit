import 'package:daily_fit/const/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../const/const_strings.dart';
import 'on_boarding_info_model.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  bool get isNotFirstPage => selectedPageIndex.value > 0;

  var pageController = PageController();

  var title = ConstStrings.onBoardingOneTitle.obs;

  forwardAction() {
    if (isLastPage) {
      Get.off(() => RouteName.loginPage);
    } else {
      selectedPageIndex.value + 1;
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  backwardAction() {
    if (isNotFirstPage) {
      pageController.animateToPage(selectedPageIndex.value - 1,
          duration: 300.milliseconds, curve: Curves.ease);
    } else {}
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        imageAsset: 'assets/svg/onboarding1.svg',
        title: ConstStrings.onBoardingOneTitle,
        description: ConstStrings.onBoardingDesc),
    OnBoardingInfo(
        imageAsset: 'assets/svg/onboarding2.svg',
        title: ConstStrings.onBoardingTwoTitle,
        description: ConstStrings.onBoardingDesc),
    OnBoardingInfo(
        imageAsset: 'assets/svg/onboarding3.svg',
        title: ConstStrings.onBoardingThreeTitle,
        description: ConstStrings.onBoardingDesc),
  ];
}
