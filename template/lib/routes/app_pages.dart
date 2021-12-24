import 'package:get/get_navigation/get_navigation.dart';
import 'package:template/pages/splash/splash_binding.dart';
import 'package:template/pages/splash/splash_page.dart';
import 'package:template/routes/app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding(),
        transition: Transition.topLevel,
        transitionDuration: const  Duration(milliseconds: 1000),
    ),
  ];
}
