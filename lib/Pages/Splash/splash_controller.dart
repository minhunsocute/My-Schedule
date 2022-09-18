import 'package:get/get.dart';

class SplashC extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5), () async {
      //ignore: avoid_print
      print('Next Pages');
    });
  }

  Future<void> gotoNextScreen() async {}
}
