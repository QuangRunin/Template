import 'dart:async';
import 'package:get/get.dart';
import 'package:template/common/constants.dart';
import 'package:template/common/storage_manager.dart';
import 'package:template/data/country.dart';
import 'package:template/localization_service.dart';
import 'package:template/model/m_country.dart';
import 'package:template/routes/app_routes.dart';

class LanguageController extends GetxController{
  List<MCountry> languageList =   List<MCountry>.from(language.map((x) => MCountry.fromJson(x)));
  String? selectedLang;
  @override
  Future<void> onInit() async{
    initLanguage();
    super.onInit();
  }
  void initLanguage() async{
    String? lg =  await StorageManager.readData(Constants.language);
    if(lg != null) {
      selectedLang = lg;
      LocalizationService.changeLocale(lg);
    } else {
      selectedLang = 'vi';
      LocalizationService.changeLocale('vi');
    }
    update();
  }
  void updateLang({value}) {
    selectedLang = value;
    LocalizationService.changeLocale(value);
    StorageManager.saveData(Constants.language, value);
    update();
  }
}