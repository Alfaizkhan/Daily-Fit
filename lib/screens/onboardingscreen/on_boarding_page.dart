import 'package:daily_fit/const/const_strings.dart';
import 'package:daily_fit/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../const/app_colors.dart';
import '../../widgets/custom_rounded_button.dart';
import '../../widgets/custom_text_view.dart';
import 'on_boarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final _onboardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 384,
                child: PageView.builder(
                  controller: _onboardingController.pageController,
                  onPageChanged: (i) {
                    _onboardingController.selectedPageIndex.value = i;

                    _onboardingController.title.value =
                        _onboardingController.onBoardingPages[i].title;
                  },
                  itemCount: _onboardingController.onBoardingPages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Builder(builder: (context) {
                          return SvgPicture.asset(
                            _onboardingController
                                .onBoardingPages[index].imageAsset,
                            fit: BoxFit.cover,
                            height: 320,
                          );
                        }),
                      ],
                    );
                  },
                ),
              ),
              Center(
                child: SizedBox(
                  height: 8,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      _onboardingController.onBoardingPages.length,
                      (index) => Obx(
                        () {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: 20.0,
                            decoration: BoxDecoration(
                              color: _onboardingController
                                          .selectedPageIndex.value ==
                                      index
                                  ? AppColors.kOnPrimaryColor
                                  : AppColors.kGreyColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => CustomTextView(
                  text: _onboardingController.title.value,
                  textSize: 30.0,
                  textColor: AppColors.kFontColor,
                  paddingBottom: 0,
                  paddingTop: 24,
                  paddingLeft: 16,
                  paddingRight: 16,
                  isCenterAlign: true,
                  fontWeight: FontWeight.bold,
                  maxLines: 2,
                ),
              ),
              CustomTextView(
                text: _onboardingController.onBoardingPages.first.description,
                textSize: 16.0,
                textColor: AppColors.kFontColor,
                paddingBottom: 0,
                paddingTop: 8,
                paddingLeft: 16,
                paddingRight: 16,
                isCenterAlign: true,
                fontWeight: FontWeight.normal,
                maxLines: 2,
              ),
              CustomRoundedButton(
                text: ConstStrings.getStartedButtonTitle,
                height: 56,
                textSize: 16,
                fontWeight: FontWeight.w500,
                radius: 12,
                isBorder: true,
                margin: const EdgeInsets.only(top: 32, left: 24, right: 24),
                onButtonClick: () => {},
              ),
              CustomRoundedButton(
                text: ConstStrings.loginButtonTitle,
                height: 56,
                textSize: 16,
                fontWeight: FontWeight.w500,
                radius: 12,
                textColor: AppColors.kPrimaryColor,
                buttonColor: Colors.white,
                isBorder: true,
                margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
                onButtonClick: () => {
                  Get.off(() => LoginPage()),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
