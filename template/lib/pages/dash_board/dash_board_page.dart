import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/language/const.dart';
import 'package:template/pages/dash_board/dash_board_controller.dart';

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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(()=> IndexedStack(
          index: controller.currentIndex.value,
          children: controller.dashBoardWidgets!,
        )),
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
                BottomNavigationBarItem(icon: controller.customIcon(index: 0,icon: '',showBadge: false, title: home.tr),title: const SizedBox()),
                BottomNavigationBarItem(icon: controller.customIcon(index: 1,icon: '',showBadge: false,title: home.tr),title: const SizedBox()),
                BottomNavigationBarItem(icon: controller.customIcon(index: 2,icon: '',showBadge: false, title:  home.tr),title: const SizedBox()),
                BottomNavigationBarItem(icon: controller.customIcon(index: 3,icon: '',showBadge: true, title: home.tr),title: const SizedBox()),
              ],
            )),
          ),
        )
    );
  }
}

