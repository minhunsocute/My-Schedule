import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_schedule/Routes/app_pages.dart';

import 'Routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteNames.splashScreen,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
