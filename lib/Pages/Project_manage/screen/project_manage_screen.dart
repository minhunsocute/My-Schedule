import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Profile/screen/profile_screen.dart';
import 'package:my_schedule/Widgets/check_container.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/List_chart/column_chart_2_column.dart';
import '../../Profile/screen/profile_dif_screen.dart';
import '../../Task_project_manager/screen/task_project_screen.dart';

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
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColors.textColor1.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Mark Completed',
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.mainColor,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Window Develop Project',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor.withOpacity(0.8),
                    ),
                    child: const Icon(
                      Icons.more_vert,
                      color: AppColors.textColor,
                      size: 18,
                    ),
                  ),
                ),
              ],
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
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/hoang.png'),
                                  ),
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
                          ' Start date',
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
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.primaryColor1,
                            ),
                            Text(
                              DateFormat().add_MMMEd().format(DateTime.now()),
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
                          ' Due date',
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
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.primaryColor2,
                            ),
                            Text(
                              DateFormat().add_MMMEd().format(DateTime.now()),
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
                  children: const [
                    Text(
                      'Status: ',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    CheckContainer(type: 1),
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
              height: 10,
              child: LinearPercentIndicator(
                lineHeight: 20,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description ',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textColor1.withOpacity(0.4),
            ),
            child: const Text(
              'Responsive and fluid design - looks great on: desktops, tablets and mobile devices, Dashboard with differents stats, Project and task managerment (create , edit, assign, etc) Client and staff management',
              style: TextStyle(
                color: AppColors.textColor1,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Statistical ',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                              color: AppColors.primaryColor1),
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
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor2),
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
          SizedBox(
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
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Subtask',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                          'My Task',
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
                            color: Colors.white,
                          ),
                        ),
                        elevation: 0,
                        backgroundColor: AppColors.mainColor,
                      ),
                      backgroundColor: AppColors.mainColor,
                      body: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            TaskCard(
                              type: 2,
                              title: 'Meeting UI/UX',
                              date: DateTime.now(),
                            ),
                            TaskCard(
                              type: 0,
                              title: 'Meeting UI/UX',
                              date: DateTime.now(),
                            ),
                            TaskCard(
                              type: 1,
                              title: 'Meeting UI/UX',
                              date: DateTime.now(),
                            ),
                            TaskCard(
                              type: 2,
                              title: 'Meeting UI/UX',
                              date: DateTime.now(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'My Task',
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
                          SizedBox(
                            width: 50,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: fakeData[i]['check'] == 1
                                      ? AppColors.primaryColor
                                      : Colors.grey,
                                ),
                              ),
                              child: fakeData[i]['check'] == 1
                                  ? const Icon(Icons.check,
                                      color: AppColors.primaryColor, size: 12)
                                  : const SizedBox(height: 10),
                            ),
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
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(fakeData[i]['image']),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  InkWell(
                    onTap: () {},
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Members',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
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
                          'Message',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.send,
                          color: AppColors.textColor,
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
          SizedBox(
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
                      () => const ProfileDiffScreen(),
                      transition: Transition.rightToLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Activity',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AddActiCard(
                  name: 'Minh Hung',
                  time: DateTime.now(),
                  imagePath: 'assets/images/hoang.png',
                ),
                MessActiCard(
                  name: 'Minh Hung',
                  time: DateTime.now(),
                  imagePath: 'assets/images/hoang.png',
                ),
                CompletTaskActiCard(
                  name: 'Duc Hoang',
                  time: DateTime.now(),
                  imagePath: 'assets/images/face.png',
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
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

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.type,
    required this.press,
  }) : super(key: key);
  final String name;
  final String imagePath;
  final String type;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textColor1.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            type,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: press,
            child: Container(
              width: double.infinity,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor.withOpacity(0.9)),
              child: const Text(
                'View',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddActiCard extends StatelessWidget {
  const AddActiCard({
    Key? key,
    required this.name,
    required this.time,
    required this.imagePath,
  }) : super(key: key);

  final String name;
  final DateTime time;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.textColor1.withOpacity(0.4)),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name add new Task',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.timelapse_rounded,
                      color: AppColors.primaryColor),
                  Text(
                    ' ${DateFormat().add_MMMEd().format(time)}',
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor.withOpacity(0.3)),
                child: const Icon(Icons.add, color: AppColors.primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessActiCard extends StatelessWidget {
  const MessActiCard({
    Key? key,
    required this.name,
    required this.time,
    required this.imagePath,
  }) : super(key: key);

  final String name;
  final DateTime time;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.textColor1.withOpacity(0.4)),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name has sent e message',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.timelapse_rounded,
                      color: AppColors.primaryColor1),
                  Text(
                    ' ${DateFormat().add_MMMEd().format(time)}',
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor1.withOpacity(0.3)),
                child: const Icon(Icons.send, color: AppColors.primaryColor1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CompletTaskActiCard extends StatelessWidget {
  const CompletTaskActiCard({
    Key? key,
    required this.name,
    required this.time,
    required this.imagePath,
  }) : super(key: key);

  final String name;
  final DateTime time;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.textColor1.withOpacity(0.4)),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name completed Task',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.timelapse_rounded,
                      color: AppColors.primaryColor2),
                  Text(
                    ' ${DateFormat().add_MMMEd().format(time)}',
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor2.withOpacity(0.3)),
                child: const Icon(Icons.check, color: AppColors.primaryColor2),
              ),
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
