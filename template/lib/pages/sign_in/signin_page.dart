import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/common/styles.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:template/components/custom_button.dart';
import 'package:template/components/custom_input.dart';
import 'package:template/language/const.dart';
import 'package:template/pages/language/language_controller.dart';
import 'package:template/pages/sign_in/signin_controller.dart';
import 'package:template/routes/app_routes.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GetBuilder<SignInController>(builder: (controller) {
     return Scaffold(
       backgroundColor: backgroundColor,
       appBar: CustomAppBar(
         title: signIn.tr,
         showBackIcon: false,
         // automaticallyImplyLeading: false,
         actions: [
           InkWell(
             onTap: () => Get.toNamed(AppRoutes.LANGUAGE),
                child: Image.asset(
                  controller.langController.selectedLang == 'vi'
                      ? 'assets/images/vn.png'
                      : 'assets/images/en.jpg',
                  width: 35,
                  height: 35,
                ),
              ),
           const SizedBox(width: 16.0),
         ],
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
                   onChanged: (value) => controller.updateForm(index: 0,value: value),
                   hint: email.tr.toLowerCase(),
                   title: email.tr,
                   errMessage: controller.emailErr,
                 ),
                 CustomInput(
                   onChanged: (value) => controller.updateForm(index: 1,value: value),
                   hint: password.tr.toLowerCase(),
                   title: password.tr,
                   errMessage: controller.passwordErr,
                 ),
                 const SizedBox(height: 100.0),
                 CustomButton(title: signIn.tr, onPressed: () => controller.onSignIn(context: context)),
                 const SizedBox(height: 10.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(notAccount.tr, style: size12W500Default),
                     const SizedBox(width: 11.0),
                     InkWell(
                       onTap: () => Get.toNamed(AppRoutes.SIGN_UP),
                       child: Text(signUp.tr, style: underline),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
       )
     );
    },
   );
  }
}
