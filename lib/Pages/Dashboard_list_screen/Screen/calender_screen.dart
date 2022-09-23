import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/today_schedule_screen.dart';
import '../../../Templates/Misc/color.dart';
import 'all_events_screen.dart';
import '../../Today_deadline/Screen/today_deadline_screen.dart';

List<Widget> pagesTest = [
  TodaysTaskScreen(),
  TodayScheduleScreen(),
  const EventsScreen(),
];
List<String> pagesText = [
  'Todays Deadline',
  'Todays Schedule',
  'All Events',
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
        title: Obx(() => Text(pagesText[check.value],
            style: const TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.bold))),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            check.value == 0
                ? check.value = 1
                : check.value == 1
                    ? check.value = 2
                    : check.value = 0;
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
      body: Obx(
        () => pagesTest[check.value],
      ),
    );
  }
}
