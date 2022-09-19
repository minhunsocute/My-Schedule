import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInC extends GetxController {
  // sign in

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool checkShowPass = false.obs;

  // forgot password
  TextEditingController emailForgotController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
