import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';
import '../../../../Widgets/check_container.dart';

class TaskExerciseCard extends StatelessWidget {
  const TaskExerciseCard({
    Key? key,
    required this.mainTitle,
    required this.title,
    required this.type,
    required this.time,
  }) : super(key: key);
  final String mainTitle;
  final String title;
  final int type;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                mainTitle,
                style: const TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor2.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.primaryColor2,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.timelapse_outlined, color: Colors.red, size: 18),
              Text(
                ' ${DateFormat().add_jm().format(time)}',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              CheckContainer(type: type),
            ],
          )
        ],
      ),
    );
  }
}
