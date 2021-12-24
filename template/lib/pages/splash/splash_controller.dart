import 'dart:async';
import 'package:get/get.dart';
import 'package:template/routes/app_routes.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin{

  @override
  Future<void> onInit() async{
    startTime();
    super.onInit();
  }
  startTime() {
    return Timer(const Duration(seconds: 2), () async {
      // Get.offNamed(AppRoutes.DASHBOARD);
    });
  }
}