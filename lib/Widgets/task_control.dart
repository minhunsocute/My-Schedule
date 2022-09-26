import 'package:flutter/material.dart';

import '../Templates/Misc/color.dart';

class TabControl extends StatelessWidget {
  const TabControl({
    Key? key,
    required this.check,
    required this.control1,
    required this.control2,
  }) : super(key: key);
  final int check;
  final Map<String, dynamic> control1;
  final Map<String, dynamic> control2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textColor1.withOpacity(0.6),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: control1['press'],
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: (check == 0)
                      ? AppColors.primaryColor
                      : Colors.transparent,
                ),
                child: Text(
                  control1['title'],
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: control2['press'],
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: (check == 1)
                      ? AppColors.primaryColor
                      : Colors.transparent,
                ),
                child: Text(
                  control2['title'],
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
