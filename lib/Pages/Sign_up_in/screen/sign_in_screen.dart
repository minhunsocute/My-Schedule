import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Sign_up_in/screen/forgot_password_screen.dart';
import 'package:my_schedule/Pages/Sign_up_in/screen/sign_up_screen.dart';
import 'package:my_schedule/Widgets/app_decoration.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Routes/route_name.dart';
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
    var widthDevice = MediaQuery.of(context).size.width;
    var heigtDevice = MediaQuery.of(context).size.height;
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
            SizedBox(height: heigtDevice / 20),
            const Text(
              'Create your \nAccount',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: heigtDevice / 40),
            const Text(
              'Login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hint: "Enter username",
              title: "Username",
              controller: controller.emailController,
              trailingIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hint: "Enter password",
              title: "Password",
              controller: controller.passwordController,
              isPasswordField: true,
              trailingIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 20),
            ButtonMain(
                title: 'Logn In',
                press: () => Get.toNamed(RouteNames.dashBoardScreen)),
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
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 0.6,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    ' Or Login with ',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 0.6,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
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
                        borderRadius: BorderRadius.circular(15),
                        border: AppDecoration.blackBorder),
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
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
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: AppDecoration.blackBorder),
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
                  'Already have an account? ',
                  style: TextStyle(
                      color: AppColors.textColor1,
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
