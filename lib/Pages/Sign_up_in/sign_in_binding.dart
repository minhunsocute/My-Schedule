import 'package:get/instance_manager.dart';
import 'package:my_schedule/Pages/Sign_up_in/sign_in_controller.dart';
import 'package:my_schedule/Pages/Splash/splash_controller.dart';

class SignInB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInC>(() => SignInC());
  }
}
