import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Routes/route_name.dart';

class SplashC extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5), () async {
      gotoNextScreen();
    });
  }

  Future<void> gotoNextScreen() async {
    Get.offAllNamed(RouteNames.introScreen);
  }
}
