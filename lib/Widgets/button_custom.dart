import 'package:flutter/material.dart';

import '../Templates/Misc/color.dart';

class ButtonMain extends StatelessWidget {
  const ButtonMain({super.key, required this.title, required this.press});
  final String title;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(2, 3),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(-2, -3),
            blurRadius: 2,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // ignore: deprecated_member_use
          primary: AppColors.primaryColor,
          shadowColor: AppColors.primaryColor,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
