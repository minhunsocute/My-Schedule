import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class TaskDataRow extends StatelessWidget {
  final String title;
  final DateTime time;
  final bool check;
  const TaskDataRow({
    Key? key,
    required this.title,
    required this.time,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Image.asset(
            check
                ? 'assets/images/app_icon.png'
                : 'assets/images/app_icon1.png',
            height: 40.0,
            width: 40.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.0,
                      width: 6.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: check ? Colors.yellow : AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      DateFormat().add_yMEd().format(time),
                      style: const TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
