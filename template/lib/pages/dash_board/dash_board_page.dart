import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:template/components/custom_image.dart';
import 'package:template/language/const.dart';
import 'package:template/pages/dash_board/dash_board_controller.dart';

import '../../localization_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var controller = Get.put(DashBoardController());
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: home.tr,
          leadingIcon: Icons.article_outlined,
          onLeadingAction: () => controller.switchAction(),
        ),
        body: GetBuilder<DashBoardController>(builder: (controller)  {
          return Stack(
            children: [
              menu(context, controller),
              AnimatedPositioned(
                  duration: controller.duration,
                  top: 0,
                  bottom: 0,
                  left: controller.isCollapsed ? 0 : 0.6 * screenWidth,
                  right: controller.isCollapsed ? 0 : -0.2 * screenWidth,
                  child: ScaleTransition(
                      scale: controller.scaleAnimation,
                      child: Material(
                          animationDuration: controller.duration,
                          borderRadius: const BorderRadius.all(const Radius.circular(40)),
                          elevation: 8,
                          color: Colors.blueAccent,
                          child: IndexedStack(
                            index: controller.currentIndex.value,
                            children: controller.dashBoardWidgets!,
                          )))),
            ],
          );
        }),
        bottomNavigationBar:Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent
          ),
          child: Container(
            height: MediaQuery.of(context).padding.bottom + 65.0,
            color: Colors.white,
            child: Obx(()=> BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.red,
              // selectedLabelStyle: textBottomActive,
              // unselectedLabelStyle: textBottomDefault,
              backgroundColor: Colors.white,
              onTap: (value) async{
                controller.changeIndex(value);
              },
              items: [
                BottomNavigationBarItem(icon: controller.customIcon(index: 0,icon: Icons.home_outlined,showBadge: false, title: home.tr),title: const SizedBox()),
                BottomNavigationBarItem(icon: controller.customIcon(index: 1,icon: Icons.ad_units_rounded,showBadge: false,title: home.tr),title: const SizedBox()),
                BottomNavigationBarItem(icon: controller.customIcon(index: 2,icon: Icons.account_balance_rounded,showBadge: false, title:  home.tr),title: const SizedBox()),
                BottomNavigationBarItem(icon: controller.customIcon(index: 3,icon: Icons.add_alert,showBadge: true, title: home.tr),title: const SizedBox()),
              ],
            )),
          ),
        )
    );
  }
  Widget menu(context, DashBoardController controller) {
    return SlideTransition(
      position: controller.slideAnimation,
      child: ScaleTransition(
        scale: controller.menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 0.0),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: controller.selectedLang,
                  items: _buildDropdownMenuItems(),
                  elevation: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  focusColor: Colors.red,
                  onChanged: (String? value) {
                    controller.updateLang(value: value);
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Dashboard", style: TextStyle(color: Colors.black, fontSize: 22)),
                      SizedBox(height: 10),
                      Text("Messages", style: TextStyle(color: Colors.black, fontSize: 22)),
                      SizedBox(height: 10),
                      Text("Utility Bills", style: TextStyle(color: Colors.black, fontSize: 22)),
                      SizedBox(height: 10),
                      Text("Funds Transfer", style: TextStyle(color: Colors.black, fontSize: 22)),
                      SizedBox(height: 10),
                      Text("Branches", style: TextStyle(color: Colors.black, fontSize: 22)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    var list = <DropdownMenuItem<String>>[];
    LocalizationService.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                key == 'vi' ? 'assets/images/vn.png' : 'assets/images/en.jpg',
                width: 20,
                height: 20
            ),
            const SizedBox(width: 16.0),
            Text(value),
          ],
        ),
      ));
    });
    return list;
  }
}