import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Sign_up_in/screen/forgot_password_screen.dart';
import 'package:my_schedule/Pages/Sign_up_in/screen/sign_up_screen.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/app_header.dart';
import '../../../Widgets/text_filed_custom.dart';
import '../sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  // final controller = Get.find<SignInC>();
  final controller = Get.put(SignInC());
  @override
  Widget build(BuildContext context) {
    // var heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: const AppHeader(),
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            const SizedBox(height: 10),
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                // border: Border.all(width: 1, color: AppColors.primaryColor),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  invertColors: true,
                  image: AssetImage('assets/gift/task.gif'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            TextFieldCustom(
              controller: controller.emailController,
              hintText: 'Email',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            PasswordFieldCustom(
              controller: controller.passwordController,
              hintText: 'Password',
            ),
            const SizedBox(height: 20),
            ButtonMain(title: 'Logn In', press: () {}),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async => await showCupertinoModalBottomSheet(
                  context: context,
                  builder: (context) => ForgotPasswordScreen(),
                ),
                child: const Text('Forgot Password?',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        decoration: TextDecoration.underline)),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: AppColors.textColor1),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 1,
                  color: AppColors.primaryColor,
                ),
                const Text(
                  ' Or Login with ',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 20,
                  height: 1,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have account ',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                InkWell(
                  onTap: () async => await Get.to(
                    () => SignUpScreen(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 200),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
