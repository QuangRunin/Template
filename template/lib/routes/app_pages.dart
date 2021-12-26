import 'package:get/get_navigation/get_navigation.dart';
import 'package:template/pages/dash_board/dash_board_binding.dart';
import 'package:template/pages/dash_board/dash_board_page.dart';
import 'package:template/pages/language/language_binding.dart';
import 'package:template/pages/language/language_page.dart';
import 'package:template/pages/sign_in/signin_binding.dart';
import 'package:template/pages/sign_in/signin_page.dart';
import 'package:template/pages/sign_up/signup_binding.dart';
import 'package:template/pages/sign_up/signup_page.dart';
import 'package:template/pages/splash/splash_binding.dart';
import 'package:template/pages/splash/splash_page.dart';
import 'package:template/routes/app_routes.dart';

class AppPages {
  static const duration = 1000;
  static var pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => const SignInPage(),
        binding: SignInBinding(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
        name: AppRoutes.SIGN_UP,
        page: () => const SignUpPage(),
        binding: SignUpBinding(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
        name: AppRoutes.LANGUAGE,
        page: () => const LanguagePage(),
        binding: LanguageBinding(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashBoardBinding(),
      transition: Transition.topLevel,
      transitionDuration: const  Duration(milliseconds: duration),
    ),
  ];
}
