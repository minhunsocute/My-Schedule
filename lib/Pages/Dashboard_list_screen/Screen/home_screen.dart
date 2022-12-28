import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/all_schedule_card.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/deadline_exercise_card.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/deadline_project_card.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/schedule_card.dart';
import '../../../Templates/Misc/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../Sign_up_in/screen/forgot_password_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: 70,
        title: headerField(),
        elevation: 0,
        backgroundColor: AppColors.greyBackground,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.greyBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          // headerField(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: checkTaskField(widthDevice),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Today Schedule',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async => await showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        centerTitle: true,
                        title: const Text(
                          'ToDay Schedule',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        leading: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                        backgroundColor: AppColors.greyBackground,
                      ),
                      backgroundColor: AppColors.greyBackground,
                      body: ListView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          AllScehduleCard(
                            time: DateTime.now(),
                            mainTitle: 'Grocert shopping add design',
                            title: 'Marget Research',
                            type: 1,
                          ),
                          AllScehduleCard(
                            time: DateTime.now(),
                            title: 'Create Low-fidelity Wireframe',
                            mainTitle: 'Uber Eats redesign challange',
                            type: 0,
                          ),
                          AllScehduleCard(
                            time: DateTime.now(),
                            title: 'How to picth a Design Sprint',
                            mainTitle: 'About design sprint',
                            type: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: const Text(
                    'See More',
                    style: TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          toDayScheduleField(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Text(
                  'Today Deadline',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor.withOpacity(0.8)),
                    child: const Text(
                      'All',
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          todayDeadlineField(widthDevice),
        ],
      ),
    );
  }

  Padding todayDeadlineField(double widthDevice) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          DeadlineProjectCard(
            mainTitle: 'CSC002 Project',
            percent: 0.8,
            deadTime: DateTime.now(),
            press: () {},
          ),
          DeadlineExerciseCard(
            mainTitle: 'CSC002 Project',
            checkComplete: true,
            deadTime: DateTime.now(),
          ),
        ],
      ),
    );
  }

  SizedBox toDayScheduleField() {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          ScheduleCard(
            date: DateTime.now(),
            mainTitle: 'Grocert shopping add design',
            title: 'Marget Research',
            type: 1,
          ),
          ScheduleCard(
            date: DateTime.now(),
            title: 'Create Low-fidelity Wireframe',
            mainTitle: 'Uber Eats redesign challange',
            type: 0,
          ),
          ScheduleCard(
            date: DateTime.now(),
            title: 'How to picth a Design Sprint',
            mainTitle: 'About design sprint',
            type: 2,
          ),
        ],
      ),
    );
  }

  Container checkTaskField(double widthDevice) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: widthDevice,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.primaryColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: (widthDevice - 80) / 2 + 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your today\'s task almost done',
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Image.asset('assets/images/app_icon1.png',
                        height: 30.0, width: 30.0),
                    Expanded(
                      child: Row(children: const [
                        Text(
                          'Schedule Done: ',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '3/8',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularPercentIndicator(
                      center: const Text(
                        '80%',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      animation: true,
                      animationDuration: 600,
                      circularStrokeCap: CircularStrokeCap.round,
                      radius: 40,
                      lineWidth: 8.0,
                      percent: 0.8,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                      progressColor: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 120,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.primaryColor.withOpacity(0.5)),
                          child:
                              const Icon(Icons.more_horiz, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row headerField() {
    return Row(
      children: [
        Image.asset(
          fit: BoxFit.cover,
          'assets/images/app_icon.png',
          height: 60.0,
          width: 60.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.textColor1,
              ),
            ),
            Text(
              'Nguyen Minh Hung',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/icons/Notification-Icon.svg',
          color: Colors.black,
          height: 25,
        ),
      ],
    );
  }
}
