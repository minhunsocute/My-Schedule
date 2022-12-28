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
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Row(
        children: [
          Image.asset(
            type == 1
                ? 'assets/images/app_icon.png'
                : 'assets/images/app_icon1.png',
            width: 50.0,
            height: 50.0,
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
                      : Colors.green.withOpacity(0.2),
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
                          : Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
