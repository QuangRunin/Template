import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/common/styles.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:template/components/custom_button.dart';
import 'package:template/components/custom_input.dart';
import 'package:template/language/const.dart';
import 'package:template/routes/app_routes.dart';
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: signUp.tr,
        showBackIcon: false,
      ),
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInput(
                  onChanged: (value) => {},
                  hint: email.tr.toLowerCase(),
                  title: email.tr,
                ),
                CustomInput(
                  onChanged: (value) => {},
                  hint: password.tr.toLowerCase(),
                  title: password.tr,
                ),
                CustomInput(
                  onChanged: (value) => {},
                  hint: confirmPassword.tr.toLowerCase(),
                  title: confirmPassword.tr,
                ),
                const SizedBox(height: 75.0),
                CustomButton(title: signUp.tr, onPressed: () => Get.toNamed(AppRoutes.DASHBOARD)),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(haveAccount.tr, style: size12W500Default),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () => Get.offAllNamed(AppRoutes.SIGN_IN),
                      child: Text(signIn.tr, style: underline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
