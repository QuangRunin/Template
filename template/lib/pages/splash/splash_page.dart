import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/language/const.dart';
import 'package:template/localization_service.dart';
import 'package:template/pages/splash/splash_controller.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SplashController());
    String? _selectedLang = LocalizationService.locale?.languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(hello.tr),
      ),
      body: Container(
        child: Center(
          child: DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            value: _selectedLang,
            items: _buildDropdownMenuItems(),
            onChanged: (String? value) {
              // setState(() => _selectedLang = value);
              LocalizationService.changeLocale(value!);
            },
          ),
        ),
      ),
    );
  }
}
List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
  var list = <DropdownMenuItem<String>>[];
  LocalizationService.langs.forEach((key, value) {
    list.add(DropdownMenuItem<String>(
      value: key,
      child: Text(key),
    ));
  });
  return list;
}
