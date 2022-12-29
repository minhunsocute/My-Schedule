import 'package:flutter/material.dart';

import '../../../../Templates/Misc/color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPress;
  Color? backgroundColor;
  Color? titleColor;
  double? height;
  CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.height,
    this.titleColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? AppColors.primaryColor,
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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // ignore: deprecated_member_use
          primary: backgroundColor ?? AppColors.primaryColor,
          shadowColor: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: titleColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
