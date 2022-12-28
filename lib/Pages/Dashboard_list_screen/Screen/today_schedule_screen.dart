import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Templates/fake_data.dart';

String convertTime(int value) {
  return '${value >= 12 ? value - 12 : value}:00 ${value >= 12 ? 'PM' : 'AM'}';
}

int getMinBetweenDates(DateTime start, DateTime end) {
  int result = end.difference(start).inMinutes;
  return result;
}

int checkDateBetween(DateTime start, DateTime end) {
  DateTime now = DateTime.now();
  if (now.isBefore(start)) {
    return 0;
  } else if (now.isAfter(end)) {
    return 2;
  }
  return 1;
}

class TodayScheduleScreen extends StatelessWidget {
  TodayScheduleScreen({
    Key? key,
  }) : super(key: key);

  RxInt select = 0.obs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        const SizedBox(height: 20.0),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10.0)
                  ],
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${DateFormat().add_MMMM().format(DateTime.now())} ${DateFormat().add_d().format(DateTime.now())}',
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Select Week',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          '10 tasks',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          for (int i = 0; i < 7; i++)
                            Expanded(
                              flex: 1,
                              child:
                                  itemBuilder(i, weekDays, select.value == i),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        const SizedBox(height: 10.0),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width / 4),
            Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
            ),
            Expanded(
              child: Container(height: 1, color: AppColors.primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 1500,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: [
                    // 60 *
                    for (int i = 0; i < 24; i++)
                      Container(
                        height: 60,
                        // color: Colors.red,
                        alignment: Alignment.topCenter,
                        child: Text(
                          convertTime(i),
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    for (int i = 1; i < schedule.length; i++)
                      Column(
                        children: [
                          SizedBox(
                              height: getMinBetweenDates(schedule[i - 1]['end'],
                                      schedule[i]['begin']) *
                                  1.0),
                          ScheduleItem(
                              schedule: schedule,
                              i: i,
                              listColor: listColor,
                              height: getMinBetweenDates(schedule[i]['begin'],
                                      schedule[i]['end']) *
                                  1.0,
                              listIcon: listIcon,
                              context: context),
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(int i, List<String> weekDays, bool check) {
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () {
        select.value = i;
      },
      child: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 500),
              alignment: Alignment.center,
              height: (check) ? 100 : 0,
              width: check ? 50 : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.blue[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: const Offset(2, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (i + 10).toString(),
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: check ? Colors.white : AppColors.textColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weekDays[i],
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: check ? Colors.white : AppColors.textColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  check
                      ? Image.asset(
                          'assets/images/app_icon.png',
                          height: 30.0,
                          width: 30.0,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    Key? key,
    required this.schedule,
    required this.i,
    required this.listColor,
    required this.height,
    required this.listIcon,
    required this.context,
  }) : super(key: key);

  final List<Map<String, dynamic>> schedule;
  final int i;
  final List<Color> listColor;
  final double height;
  final List<IconData> listIcon;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int type = checkDateBetween(schedule[i]['begin'], schedule[i]['end']);
        await showDialog(
          useRootNavigator: false,
          barrierColor: Colors.black54,
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor,
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${listMainTitle[schedule[i]['type']]} ',
                                style: const TextStyle(
                                  color: AppColors.textColor1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                schedule[i]['title'],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/images/app_icon1.png',
                            height: 40.0, width: 40.0),
                      ],
                    ),
                    // const SizedBox(height: 10),

                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse_sharp,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          ' ${DateFormat().add_jm().format(schedule[i]['begin'])} - ${DateFormat().add_jm().format(schedule[i]['end'])}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: type == 0
                                ? Colors.blue.withOpacity(0.2)
                                : type == 1
                                    ? Colors.orange.withOpacity(0.2)
                                    : Colors.green.withOpacity(0.2),
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
                                      : Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10.0)],
        ),
        width: double.infinity,
        child: height > (60 * 2 - 15)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${listMainTitle[schedule[i]['type']]} ',
                              style: const TextStyle(
                                color: AppColors.textColor1,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            // const SizedBox(height: 10),
                            Text(
                              schedule[i]['title'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/app_icon1.png',
                          height: 40.0, width: 40.0),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.timelapse_sharp,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        ' ${DateFormat().add_jm().format(schedule[i]['begin'])} - ${DateFormat().add_jm().format(schedule[i]['end'])}',
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Image.asset(
                    'assets/images/app_icon1.png',
                    height: 50.0,
                    width: 50.0,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 150,
                    child: Text(
                      schedule[i]['title'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
