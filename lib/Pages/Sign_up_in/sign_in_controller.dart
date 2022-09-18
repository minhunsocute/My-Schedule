import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInC extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool checkShowPass = false.obs;
}
