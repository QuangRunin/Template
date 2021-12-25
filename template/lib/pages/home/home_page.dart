import 'package:flutter/material.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:template/language/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 16),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          );
        },),
      ),
    );
  }
}
