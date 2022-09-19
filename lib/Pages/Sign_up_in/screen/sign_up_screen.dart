import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/app_header.dart';
import '../../../Widgets/button_custom.dart';
import '../../../Widgets/text_filed_custom.dart';
import '../sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignUpC());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const AppHeader(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    invertColors: true,
                    image: AssetImage('assets/gift/task.gif'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Text(
                'Create your account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              TextFieldCustom(
                controller: controller.userController,
                hintText: 'Username',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
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
              PasswordFieldCustom(
                controller: controller.repassController,
                hintText: 'Re-Password',
              ),
              const SizedBox(height: 20),
              ButtonMain(title: 'Register', press: () {}),
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
            ],
          ),
        ),
      ),
    );
  }
}
