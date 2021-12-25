import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/language/const.dart';
import 'package:template/pages/splash/splash_controller.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SplashController());
    return Scaffold(
      appBar: AppBar(
        title: Text(hello.tr),
      ),
      body: Container(),
    );
  }
}
