import 'package:get/get.dart';
import 'package:template/pages/dash_board/dash_board_controller.dart';
import 'package:template/pages/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }

}