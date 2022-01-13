import 'package:flutter/material.dart';
import 'package:template/components/ripple_animation.dart';
class LaboratoryPage extends StatelessWidget {
  const LaboratoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // RippleAnimation(
          //     repeat: true,
          //     color: Colors.blue,
          //     minRadius: 20,
          //     ripplesCount: 3,
          //     child: Container(
          //       width: 50,
          //       height: 50,
          //       color: Colors.red,
          //
          //     )
          // ),
        ],
      ),
    );
  }
}
