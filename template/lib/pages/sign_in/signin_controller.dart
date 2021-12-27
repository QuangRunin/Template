import 'dart:math';

import 'package:get/get.dart';
import 'package:template/common/utils.dart';
import 'package:template/pages/language/language_controller.dart';
import 'package:template/routes/app_routes.dart';

class SignInController extends GetxController{
  var langController = Get.put(LanguageController());
  String  email = "";
  String  password = "";
  var  emailErr = null;
  var  passwordErr = null;
  @override
  Future<void> onInit() async{
    langController.initLanguage();
    super.onInit();
  }
  void updateForm({index, value}) {
    switch (index) {
      case 0:
        email = value;
        emailValidate();
        break;
      case 1:
        password = value;
        passValidate();
        break;
    }
    update();
  }
  bool emailValidate() {
    if (email.isEmpty) {
      emailErr = 'Vui lòng nhập địa chỉ Email';
      update();
      return false;
    } else if(email.isNotEmpty) {
      if(!validateEmail(email)) {
        emailErr = 'Email không đúng định dạng';
        update();
        return false;
      } else {
        emailErr = null;
        return true;
      }
    } else {
      emailErr = null;
      return true;
    }
  }

  bool passValidate() {
    if (password.isEmpty) {
      passwordErr = 'Vui lòng nhập mật khẩu';
      update();
      return false;
    } else {
      passwordErr = null;
      return true;
    }
  }

  void onSignIn({context}) {
    if (emailValidate() && passValidate()) {
      Get.toNamed(AppRoutes.DASHBOARD);
    }
  }
}