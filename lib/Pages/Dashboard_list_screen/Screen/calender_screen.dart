import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/today_schedule_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Templates/fake_data.dart';
import '../../../Widgets/pub_dev/calender_setup.dart';
import 'all_events_screen.dart';
import 'today_task_screen.dart';

List<Widget> pagesTest = [
  TodaysTaskScreen(),
  TodayScheduleScreen(),
];

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});
  RxInt check = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'All Events',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            check.value = 1 - check.value;
          },
          child: const Icon(
            Icons.change_circle,
            color: AppColors.primaryColor,
            size: 35,
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage('assets/images/face.png')),
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: EventsScreen(),
      // Obx(
      //   () => pagesTest[check.value],
      // ),
    );
  }
}
