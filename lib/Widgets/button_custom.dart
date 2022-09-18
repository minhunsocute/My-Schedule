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
        borderRadius: BorderRadius.circular(5),
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
            borderRadius: BorderRadius.circular(10),
          ),
          // ignore: deprecated_member_use
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
