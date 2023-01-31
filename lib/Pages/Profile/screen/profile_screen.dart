import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Pages/Profile/screen/profile_dif_screen.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:badges/badges.dart';

import '../../../Widgets/List_chart/column_chart_2_column.dart';
import 'Widgets/github_calender_built.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  List<Map<String, dynamic>> fakeDataCommit = [
    {
      'time': DateTime.now().subtract(const Duration(days: 8)),
      'commit': 2,
    },
    {
      'time': DateTime.now().subtract(const Duration(days: 7)),
      'commit': 2,
    },
    {
      'time': DateTime.now(),
      'commit': 2,
    },
    {
      'time': DateTime.now().subtract(const Duration(days: 2)),
      'commit': 2,
    },
    {
      'time': DateTime.now().add(const Duration(days: 20)),
      'commit': 2,
    },
    {
      'time': DateTime.now().add(const Duration(days: 1)),
      'commit': 15,
    },
    {
      'time': DateTime.now().add(const Duration(days: 2)),
      'commit': 6,
    },
    {
      'time': DateTime.now().add(const Duration(days: 3)),
      'commit': 7,
    },
    {
      'time': DateTime.now().add(const Duration(days: 4)),
      'commit': 3,
    },
    {
      'time': DateTime.now().add(const Duration(days: 5)),
      'commit': 4,
    },
    {
      'time': DateTime.now().add(const Duration(days: 6)),
      'commit': 10,
    },
    {
      'time': DateTime.now().add(const Duration(days: 88)),
      'commit': 18,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Over(
        widthDevice: Get.width,
        heightDevice: Get.height,
        listView: Column(
          children: [
            _headerField(),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.textColor1.withOpacity(0.4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Activity Chart View',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          // await _showDatePicker(context: context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                          child: const Text(
                            'Select',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // GitHubCalenderBuit(fakeDataCommit: fakeDataCommit)
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ColumnChartTwoColumnCustom(
                      barGroups: [
                        makeGroupData(0, 150 / 300 * 20, 60 / 300 * 20),
                        makeGroupData(1, 180 / 300 * 20, 70 / 300 * 20),
                        makeGroupData(2, 80 / 300 * 20, 50 / 300 * 20),
                        makeGroupData(2, 100 / 300 * 20, 30 / 300 * 20),
                      ],
                      members: const ['Hung', 'Hoang', 'Hieu', 'Duy'],
                      columnData: 300,
                    ),
                  ),
                  // gitHubCommitField()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _headerField() {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _typeColumn({required String data, required String title}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textColor1,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      color: AppColors.primaryColor1,
      width: 7,
    ),
    BarChartRodData(
      toY: y2,
      color: AppColors.primaryColor2,
      width: 7,
    ),
  ]);
}
