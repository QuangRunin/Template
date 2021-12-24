import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:template/core/env/env.dart';
import 'package:template/routes/app_pages.dart';
import 'package:template/routes/app_routes.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  late String appTitle;
  if (env == Environment.dev) {
    appTitle = 'Template Dev';

    debugPrint('Flavor: $appTitle');
  } else if (env == Environment.stg) {
    appTitle = 'Template Stg';

    debugPrint('Flavor: $appTitle');
  } else if (env == Environment.prod) {
    appTitle = 'Template';

    debugPrint('Flavor: $appTitle');
  }
  runApp(
      const MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetMaterialApp(
        initialRoute: AppRoutes.SPLASH,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        defaultTransition: Transition.fade,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        builder: (BuildContext context, Widget? child){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
    );
  }
}