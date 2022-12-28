import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class DeadlineExerciseCard extends StatelessWidget {
  const DeadlineExerciseCard({
    Key? key,
    required this.mainTitle,
    required this.checkComplete,
    required this.deadTime,
  }) : super(key: key);
  final String mainTitle;
  final bool checkComplete;
  final DateTime deadTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.access_time_filled_sharp,
                          color: Colors.red.withOpacity(0.8)),
                      Text(
                        ' ${DateFormat().add_MMMEd().format(deadTime)} / ${DateFormat().add_jm().format(deadTime)}',
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (checkComplete)
                      ? Colors.green.withOpacity(0.4)
                      : Colors.red.withOpacity(0.4),
                  border: Border.all(
                    width: 1,
                    color: (checkComplete) ? Colors.green : Colors.red,
                  ),
                ),
                child: Text(
                  (checkComplete) ? 'Done' : 'Undone',
                  style: TextStyle(
                    color: (checkComplete) ? Colors.green : Colors.red,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
