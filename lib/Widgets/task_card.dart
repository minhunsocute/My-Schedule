import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Templates/Misc/color.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.type,
    required this.title,
    required this.date,
  }) : super(key: key);
  final int type;
  final String title;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textColor1.withOpacity(0.4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: type == 2 ? AppColors.primaryColor : Colors.grey,
                ),
              ),
              child: type == 2
                  ? const Icon(Icons.check,
                      color: AppColors.primaryColor, size: 12)
                  : const SizedBox(height: 10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat().add_MMMEd().format(date),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: type == 0
                  ? Colors.blue.withOpacity(0.2)
                  : type == 1
                      ? Colors.orange.withOpacity(0.2)
                      : AppColors.primaryColor2.withOpacity(0.2),
            ),
            child: Text(
              type == 0
                  ? 'To-do'
                  : type == 1
                      ? 'In Progress'
                      : 'Done',
              style: TextStyle(
                  color: type == 0
                      ? Colors.blue
                      : type == 1
                          ? Colors.orange
                          : AppColors.primaryColor2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
