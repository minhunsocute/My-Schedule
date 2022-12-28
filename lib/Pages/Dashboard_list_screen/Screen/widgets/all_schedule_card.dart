import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class AllScehduleCard extends StatelessWidget {
  const AllScehduleCard({
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
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTitle,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/app_icon1.png',
                  height: 40.0, width: 40.0),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.timelapse_outlined,
                color: AppColors.primaryColor,
                size: 22.0,
              ),
              Text(
                ' ${DateFormat().add_jm().format(time)}',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
