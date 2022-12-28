import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Profile/screen/profile_screen.dart';
import 'package:my_schedule/Pages/Project_manage/screen/add_task_screen.dart';
import 'package:my_schedule/Widgets/button_custom.dart';
import 'package:my_schedule/Widgets/check_container.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/List_chart/column_chart_2_column.dart';
import '../../../Widgets/task_card.dart';
import '../../Messenger/screen/mess_group_screen.dart';
import '../../Profile/screen/profile_dif_screen.dart';
import '../../Task_project_manager/screen/task_project_screen.dart';
import '../widgets/activiti_card.dart';
import '../widgets/bottom_my_task.dart';
import '../widgets/profile_card.dart';

class ProjectManageScreen extends StatelessWidget {
  const ProjectManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fakeData = [
      {
        'check': 0,
        'title': 'Make UI/UX Audit',
        'image': 'assets/images/hoang.png',
      },
      {
        'check': 1,
        'title': 'Meeting with design team',
        'image': 'assets/images/face.png',
      },
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.textColor,
              size: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5.0)
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/app_icon.png',
                      height: 30.0,
                      width: 30.0,
                    ),
                    const Text(
                      'Mark Completed',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.greyBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Window Develop Project',
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Members',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            for (int i = 1; i <= 3; i++)
                              Container(
                                width: 22,
                                height: 22,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                ),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.mainColor,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/hoang.png'),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Start date',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Calendar.svg',
                              width: 16.0,
                              height: 16.0,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              ' ${DateFormat().add_MMMEd().format(DateTime.now())}',
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Due date',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Calendar.svg',
                              width: 16.0,
                              height: 16.0,
                              color: Colors.red,
                            ),
                            Text(
                              ' ${DateFormat().add_MMMEd().format(DateTime.now())}',
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const CheckContainer(type: 1),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              height: 8,
              child: LinearPercentIndicator(
                lineHeight: 10,
                percent: 0.4,
                progressColor: AppColors.primaryColor,
                backgroundColor: Colors.grey.withOpacity(0.2),
                animation: true,
                animationDuration: 1000,
                barRadius: const Radius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description ',
                style: TextStyle(
                  color: AppColors.textColor2,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.mainColor,
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10.0)
              ],
            ),
            child: const Text(
              'Responsive and fluid design - looks great on: desktops, tablets and mobile devices, Dashboard with differents stats, Project and task managerment (create , edit, assign, etc) Client and staff management',
              style: TextStyle(
                color: AppColors.textColor1,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Statistical ',
                  style: TextStyle(
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'To-do',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow[500]),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Done',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // const SizedBox(height: 10),
          _chartField(),
          const SizedBox(height: 10.0),
          _prgressField(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Subtask',
                  style: TextStyle(
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async => await showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => BottomMytask(),
                  ),
                  child: const Text(
                    'My Task',
                    style: TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _subtaskField(fakeData),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Members',
                  style: TextStyle(
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.to(
                    () => MessGroupScreen(),
                    transition: Transition.rightToLeft,
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor.withOpacity(0.8),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Message ',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.send,
                          color: AppColors.mainColor,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _memberField(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Activity',
                  style: TextStyle(
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See More',
                    style: TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ActivitiCard(
                  title:
                      'Good Job Guys Good Job Guys Good Job GuysGood Job GuysGood Job GuysGood Job Guys Good Job Guys',
                  time: DateTime.now(),
                  header: 'Hoang has sent a message',
                  image: 'assets/images/hoang.png',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  SizedBox _memberField() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          ...fakeDataMembers.map(
            (e) => ProfileCard(
              name: e['name'],
              imagePath: e['imagePath'],
              type: e['type'],
              press: () => Get.to(
                () => ProfileDiffScreen(),
                transition: Transition.rightToLeft,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _subtaskField(List<Map<String, dynamic>> fakeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: AppColors.textColor1,
          ),
        ),
        child: Column(
          children: [
            for (int i = 0; i < fakeData.length; i++)
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.textColor1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      fakeData[i]['check'] == 1
                          ? 'assets/images/app_icon.png'
                          : 'assets/images/app_icon1.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    Text(
                      fakeData[i]['title'],
                      style: TextStyle(
                        decoration: (fakeData[i]['check'] == 1
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                        color: AppColors.textColor,
                        fontStyle: fakeData[i]['check'] == 1
                            ? FontStyle.italic
                            : FontStyle.normal,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(fakeData[i]['image']),
                        ),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 5.0)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            InkWell(
              onTap: () {
                Get.to(
                  () => AddTaskScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: const [
                    Icon(Icons.add, color: AppColors.primaryColor),
                    SizedBox(width: 7),
                    Text(
                      'Add task....',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _prgressField() {
    return Container(
      width: double.infinity,
      height: 120.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10.0)],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80.0,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    backgroundColor: Colors.yellow,
                    progressColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.3,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Colors.grey,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/app_icon1.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                    const Text(
                      '80% (To-do)',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/app_icon.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                    const Text(
                      '20% (Done)',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _chartField() {
    return SizedBox(
      width: double.infinity,
      height: 240,
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
    );
  }
}

List<Map<String, dynamic>> fakeDataMembers = [
  {
    'name': 'Duc Hoang',
    'imagePath': 'assets/images/face.png',
    'type': 'Backend Developer',
  },
  {
    'name': 'Minh Hung',
    'imagePath': 'assets/images/hoang.png',
    'type': 'Frontend Developer',
  },
  {
    'name': 'Trung Hieu',
    'imagePath': 'assets/images/google.png',
    'type': 'UI/UX Designer',
  }
];

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      color: AppColors.primaryColor,
      width: 7,
    ),
    BarChartRodData(
      toY: y2,
      color: Colors.yellow,
      width: 7,
    ),
  ]);
}
