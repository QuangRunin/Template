import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/common/constants.dart';
import 'package:template/common/storage_manager.dart';
import 'package:template/data/country.dart';
import 'package:template/language/const.dart';
import 'package:template/localization_service.dart';
import 'package:template/model/m_country.dart';
import 'package:template/model/m_left_menu.dart';
import 'package:template/pages/home/home_page.dart';
import 'package:template/pages/laboratory/laboratory_page.dart';

class DashBoardController extends GetxController with GetTickerProviderStateMixin{
  var currentIndex = 0.obs;
  int bottomNvgLastIndex = 0;
  List<MCountry> languageList =   List<MCountry>.from(language.map((x) => MCountry.fromJson(x)));
  List<MLeftMenu> leftMenu =   List<MLeftMenu>.from(menu.map((x) => MLeftMenu.fromJson(x)));
  String? selectedLang;
  List<Widget>? dashBoardWidgets = <Widget>[
    const HomePage(),
    const LaboratoryPage(),
    const HomePage(),
    const HomePage(),
  ];
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> menuScaleAnimation;
  late Animation<Offset> slideAnimation;
  @override
  Future<void> onInit() async{
    controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(controller);
    menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(controller);
    slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(controller);
    initLanguage();
    super.onInit();
  }
  @override
  Future<void> onClose() async{
    controller.dispose();
    super.onClose();
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
  void changeIndex(value){
    currentIndex.value = value;
    update();
  }
  void actionMenu({index, screen}) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        Get.toNamed(screen);
        break;
      case 5:
        break;
    }
    controller.reverse();
    isCollapsed = !isCollapsed;
    update();
  }
  void updateLang({value}) {
    selectedLang = value;
    LocalizationService.changeLocale(value);
    StorageManager.saveData(Constants.language, value);
    update();
  }
  void switchAction() {
    if(isCollapsed) {
      controller.forward();
    } else {
      controller.reverse();
    }
    isCollapsed = !isCollapsed;
    update();
  }
  Widget customIcon({index, icon,showBadge,title}) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // showBadge ? Container(
          //   width: 6.0,
          //   height: 6.0,
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(3.0)),
          //     color: Colors.red,
          //   ),
          // ) :  const SizedBox(height: 5.0),
          // const SizedBox(height: 4),
          Icon(
            icon,
            color: index != currentIndex.value ? Colors.black : Colors.red,
            size: index != currentIndex.value ? 20 : 24,
          ),
          // Image.asset(icon,color: index != currentIndex.value ? Colors.black : Colors.red),
          // Text(title),
        ],
      ),
    );
  }
  Widget customTitle(index,title) {
    return Text(title);
  }
}
