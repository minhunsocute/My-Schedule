import 'package:flutter/material.dart';

import '../../../Templates/Misc/color.dart';
import '../controller/project_manage_controller.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.e,
  }) : super(key: key);
  final Item e;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textColor1.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(e.image),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            e.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            e.type,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
