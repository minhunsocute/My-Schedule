import 'package:flutter/material.dart';

import '../../../Templates/Misc/color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.type,
    required this.press,
  }) : super(key: key);
  final String name;
  final String imagePath;
  final String type;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 20, top: 5.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.mainColor,
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5.0)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            type,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: press,
            child: Container(
              width: double.infinity,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor.withOpacity(0.9)),
              child: const Text(
                'View',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
