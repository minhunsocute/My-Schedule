import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/app_header.dart';
import '../sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final controller = Get.find<SignInC>();
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
                    onTap: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordFieldCustom extends StatefulWidget {
  const PasswordFieldCustom({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  State<PasswordFieldCustom> createState() => _PasswordFieldCustomState();
}

class _PasswordFieldCustomState extends State<PasswordFieldCustom> {
  bool checkShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                checkShow = !checkShow;
              });
            },
            child: Container(
              width: 60,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Icon(
                (checkShow) ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              obscureText: checkShow,
              controller: widget.controller,
              style: const TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
