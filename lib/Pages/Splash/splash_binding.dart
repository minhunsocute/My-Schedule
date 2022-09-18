import 'package:get/instance_manager.dart';
import 'package:my_schedule/Pages/Splash/splash_controller.dart';

class SplashB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashC>(() => SplashC());
  }
}
