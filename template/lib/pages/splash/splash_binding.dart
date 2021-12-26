import 'package:get/get.dart';
import 'package:template/pages/language/language_controller.dart';
import 'package:template/pages/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}