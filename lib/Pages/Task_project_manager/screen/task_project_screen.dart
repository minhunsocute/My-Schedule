import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Routes/route_name.dart';
import 'package:my_schedule/Templates/Misc/color.dart';

import '../../../Templates/fake_data.dart';
import '../../Dashboard_list_screen/Screen/home_screen.dart';
import '../../Project_manage/screen/project_manage_screen.dart';

class TaskProjectScreen extends StatelessWidget {
  TaskProjectScreen({super.key});
  RxInt touchedIndex = (-1).obs;
  RxInt select = 0.obs;

  List<Widget> listPage = [
    ProjectField(),
    TaskField(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          ' Task Project Manage',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
      backgroundColor: AppColors.mainColor,
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          pieChartField(),
          const SizedBox(height: 5),
          Obx(
            () => Align(
              alignment: Alignment.center,
              child: Container(
                width: 140,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.textColor1.withOpacity(0.6),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          select.value = 0;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: (select.value == 0)
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                          child: const Text(
                            'Project',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          select.value = 1;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: (select.value == 1)
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                          child: const Text(
                            'Task',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(() => listPage[select.value])
        ],
      ),
    );
  }

  Padding pieChartField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.textColor1.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Obx(
                () => PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex.value = -1;
                          return;
                        }
                        touchedIndex.value = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      },
                    ),
                    startDegreeOffset: 180,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 1,
                    centerSpaceRadius: 40,
                    sections: data
                        .asMap()
                        .map<int, PieChartSectionData>((index, data) {
                          final isTouched = index == touchedIndex.value;

                          return MapEntry(
                            index,
                            PieChartSectionData(
                              color: data.color,
                              value: data.percents,
                              title: '',
                              // borderSide:
                              //     const BorderSide(style: BorderStyle.solid),
                              radius: isTouched ? 30 : 20,
                              titleStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              titlePositionPercentageOffset: 0.55,
                              badgeWidget: Badge(
                                data.imagePath,
                                size: isTouched ? 30.0 : 20.0,
                                borderColor: data.color,
                              ),
                              badgePositionPercentageOffset: .98,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ChartDataRow(
                    title: 'New Task',
                    color: AppColors.primaryColor1,
                    data: 0.3,
                  ),
                  SizedBox(height: 5),
                  ChartDataRow(
                    title: 'In Process',
                    color: AppColors.primaryColor,
                    data: 0.4,
                  ),
                  SizedBox(height: 5),
                  ChartDataRow(
                    title: 'Completed',
                    color: AppColors.primaryColor2,
                    data: 0.3,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskField extends StatelessWidget {
  const TaskField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'My Task',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor.withOpacity(0.9)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'All',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.type,
    required this.title,
    required this.date,
  }) : super(key: key);
  final int type;
  final String title;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textColor1.withOpacity(0.4),
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
                  color: type == 2 ? AppColors.primaryColor : Colors.grey,
                ),
              ),
              child: type == 2
                  ? const Icon(Icons.check,
                      color: AppColors.primaryColor, size: 12)
                  : const SizedBox(height: 10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat().add_MMMEd().format(date),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: type == 0
                  ? Colors.blue.withOpacity(0.2)
                  : type == 1
                      ? Colors.orange.withOpacity(0.2)
                      : AppColors.primaryColor2.withOpacity(0.2),
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
                          : AppColors.primaryColor2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectField extends StatelessWidget {
  const ProjectField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'My Project',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor.withOpacity(0.9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'All',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DeadlineProjectCard(
            mainTitle: 'CSC002 Project',
            percent: 0.8,
            deadTime: DateTime.now(),
            press: () {
              Get.to(() => ProjectManageScreen(),
                  transition: Transition.downToUp);
            },
          ),
          DeadlineProjectCard(
            mainTitle: 'CSC002 Project',
            percent: 1,
            deadTime: DateTime.now(),
            press: () {},
          ),
          DeadlineProjectCard(
            mainTitle: 'CSC002 Project',
            percent: 0.8,
            deadTime: DateTime.now(),
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ChartDataRow extends StatelessWidget {
  const ChartDataRow({
    Key? key,
    required this.title,
    required this.color,
    required this.data,
  }) : super(key: key);
  final String title;
  final Color color;
  final double data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 5),
        Text(
          '$title: ',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          '${(data * 100)}%',
          style: const TextStyle(
              color: AppColors.textColor1,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(
          svgAsset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
