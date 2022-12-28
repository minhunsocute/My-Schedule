import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.date,
    required this.title,
    required this.mainTitle,
    required this.type,
  }) : super(key: key);

  final DateTime date;
  final String title;
  final String mainTitle;
  final int type; // 0: to-do , 1: In Progress, 2: Done
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10.0, bottom: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainTitle,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.textColor1,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          title,
                          maxLines: 2,
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/app_icon1.png',
                    height: 50.0,
                    width: 50.0,
                  )
                ],
              ),
              const SizedBox(height: 10),
            ]),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.access_time_filled_outlined,
                    color: (type == 0)
                        ? AppColors.primaryColor
                        : (type == 1)
                            ? AppColors.primaryColor
                            : AppColors.primaryColor2),
                Text(
                  ' ${DateFormat().add_jm().format(date)}',
                  overflow: TextOverflow.fade,
                  style:
                      const TextStyle(color: AppColors.textColor, fontSize: 12),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (type == 0)
                        ? AppColors.primaryColor.withOpacity(0.3)
                        : (type == 1)
                            ? AppColors.primaryColor1.withOpacity(0.3)
                            : AppColors.primaryColor2.withOpacity(0.3),
                  ),
                  child: Text(
                    type == 0
                        ? 'To-do'
                        : type == 1
                            ? 'In Progress'
                            : 'Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: (type == 0)
                          ? AppColors.primaryColor
                          : (type == 1)
                              ? AppColors.primaryColor
                              : Colors.green,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
