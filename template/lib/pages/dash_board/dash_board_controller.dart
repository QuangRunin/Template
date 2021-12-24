import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/pages/home/home_page.dart';

class DashBoardController extends GetxController {
  var currentIndex = 0.obs;
  int bottomNvgLastIndex = 0;
  List<Widget>? dashBoardWidgets = <Widget>[
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];
  @override
  Future<void> onInit() async{
    super.onInit();
  }
  void changeIndex(value){
    currentIndex.value = value;
    update();
  }
  Widget customIcon({index, icon,showBadge,title}) {
    return SizedBox(
      height: 52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showBadge ? Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              color: Colors.red,
            ),
          ) :  const SizedBox(height: 5.0),
          const SizedBox(height: 5),
          Image.asset(icon,color: index != currentIndex.value ? Colors.black : Colors.red),
          Text(title),
        ],
      ),
    );
  }
  Widget customTitle(index,title) {
    return Text(title);
  }
}
