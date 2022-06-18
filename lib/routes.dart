import 'package:daily_fit/screens/login/login_page.dart';
import 'package:daily_fit/screens/onboardingscreen/on_boarding_page.dart';
import 'package:daily_fit/screens/signup/sign_up_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'const/route_name.dart';

routes() => [
      // OnBoarding Page
      GetPage(
        name: RouteName.onBoardingPage,
        page: () => OnBoardingPage(),
      ),
      // Login Page
      GetPage(
        name: RouteName.loginPage,
        page: () => const LoginPage(),
      ),
      // SignUp Page
      GetPage(
        name: RouteName.signUpPage,
        page: () => const SignUpPage(),
      ),
    ];
