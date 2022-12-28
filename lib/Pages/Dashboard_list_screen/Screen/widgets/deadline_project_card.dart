import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../Templates/Misc/color.dart';

class DeadlineProjectCard extends StatelessWidget {
  const DeadlineProjectCard({
    Key? key,
    required this.mainTitle,
    required this.percent,
    required this.deadTime,
    required this.press,
  }) : super(key: key);
  final String mainTitle;
  final double percent;
  final DateTime deadTime;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
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
                Text(
                  mainTitle,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (percent >= 1)
                        ? Colors.green.withOpacity(0.4)
                        : Colors.red.withOpacity(0.4),
                    border: Border.all(
                      width: 1,
                      color: (percent >= 1) ? Colors.green : Colors.red,
                    ),
                  ),
                  child: Text(
                    (percent >= 1) ? 'Done' : 'Undone',
                    style: TextStyle(
                        color: (percent >= 1) ? Colors.green : Colors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Team members',
                        style: TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              for (int i = 1; i <= 3; i++)
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(left: (14 * i) * 1.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/hoang.png'),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                  width: 24,
                                  height: 24,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      left: (14 * 4) * 1.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.mainColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    '+2',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
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
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularPercentIndicator(
                        center: Text(
                          '${(percent * 100).round()}%',
                          style: TextStyle(
                            color: percent >= 1
                                ? Colors.green
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        animation: true,
                        animationDuration: 600,
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 30,
                        lineWidth: 3.0,
                        percent: percent,
                        backgroundColor: (percent < 1)
                            ? AppColors.primaryColor.withOpacity(0.1)
                            : Colors.green.withOpacity(0.1),
                        progressColor: (percent < 1)
                            ? AppColors.primaryColor
                            : Colors.green,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
