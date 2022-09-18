import 'package:flutter/material.dart';

import '../Templates/Misc/color.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset('assets/images/icon.png'),
        ),
        const SizedBox(width: 5),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            children: [
              TextSpan(
                  text: 'Hello, I am ',
                  style: TextStyle(color: AppColors.textColor)),
              TextSpan(
                text: 'MSchedule',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ],
    );
  }
}
