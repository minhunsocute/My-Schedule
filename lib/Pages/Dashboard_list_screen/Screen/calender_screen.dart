import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Templates/fake_data.dart';
import '../../../Widgets/pub_dev/calender_setup.dart';

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

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});

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
          'Today\'s Tasks',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
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
      body: TodaysTaskScreen(),
    );
  }
}

class TodaysTaskScreen extends StatefulWidget {
  TodaysTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TodaysTaskScreen> createState() => _TodaysTaskScreenState();
}

class _TodaysTaskScreenState extends State<TodaysTaskScreen> {
  late DateTime _selectedDate = DateTime.now().add(const Duration(days: 2));
  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  RxInt onFocus = 0.obs;
  List<Map<String, dynamic>> listOption = [
    {
      'title': 'All',
      'func': () {},
    },
    {
      'title': 'To-do',
      'func': () {},
    },
    {
      'title': 'In Progress',
      'func': () {},
    },
    {
      'title': 'Done',
      'func': () {},
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Text(
                '${DateFormat().add_MMMM().format(_selectedDate)} ${DateFormat().add_d().format(_selectedDate)}',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const Text(
                '10 tasks today',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        CalendarTimeline(
          initialDate: _selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
          onDateSelected: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
          leftMargin: 20,

          monthColor: AppColors.textColor,
          dayColor: AppColors.textColor1,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          dotsColor: const Color(0xFF333A47),
          // selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        const SizedBox(height: 20),
        Obx(
          () => SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                const SizedBox(width: 10),
                for (int i = 0; i < listOption.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        onFocus.value = i;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (onFocus.value == i)
                              ? AppColors.primaryColor
                              : AppColors.primaryColor.withOpacity(0.2),
                        ),
                        child: Text(
                          listOption[i]['title'],
                          style: TextStyle(
                            color: (onFocus.value == i)
                                ? AppColors.textColor
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            TaskProjectCard(
              mainTitle: 'Windows Development',
              title: 'My Schedule App Project',
              members: 3,
              time: DateTime.now(),
              percent: 0.9,
              type: 0,
            ),
            TaskExerciseCard(
              mainTitle: 'Windows Development',
              title: 'My Schedule App Project',
              time: DateTime.now(),
              type: 0,
            ),
            TaskExerciseCard(
              mainTitle: 'Windows Development',
              title: 'My Schedule App Project',
              time: DateTime.now(),
              type: 1,
            ),
            TaskExerciseCard(
              mainTitle: 'Windows Development',
              title: 'My Schedule App Project',
              time: DateTime.now(),
              type: 2,
            ),
          ],
        )
      ],
    );
  }
}

class TaskExerciseCard extends StatelessWidget {
  const TaskExerciseCard({
    Key? key,
    required this.mainTitle,
    required this.title,
    required this.type,
    required this.time,
  }) : super(key: key);
  final String mainTitle;
  final String title;
  final int type;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                mainTitle,
                style: const TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor2.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.primaryColor2,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.timelapse_outlined, color: Colors.red, size: 18),
              Text(
                ' ${DateFormat().add_jm().format(time)}',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              CheckContainer(type: type),
            ],
          )
        ],
      ),
    );
  }
}

class CheckContainer extends StatelessWidget {
  const CheckContainer({
    Key? key,
    required this.type,
  }) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: type == 0
            ? Colors.blue.withOpacity(0.2)
            : type == 1
                ? Colors.orange.withOpacity(0.2)
                : Colors.purple.withOpacity(0.2),
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
                    : Colors.purple,
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class TaskProjectCard extends StatelessWidget {
  const TaskProjectCard({
    Key? key,
    required this.mainTitle,
    required this.title,
    required this.members,
    required this.time,
    required this.percent,
    required this.type,
  }) : super(key: key);
  final String mainTitle;
  final String title;
  final int members;
  final DateTime time;
  final double percent;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                mainTitle,
                style: const TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor1.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.people,
                  color: AppColors.primaryColor1,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 280,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        color: AppColors.primaryColor,
                        size: 15,
                      ),
                      RichText(
                          text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(
                            text: ' No Members: ',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          TextSpan(
                            text: '$members ',
                            style: const TextStyle(color: AppColors.textColor),
                          ),
                        ],
                      )),
                    ],
                  )
                ],
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      animation: true,
                      animationDuration: 600,
                      circularStrokeCap: CircularStrokeCap.round,
                      radius: 30,
                      lineWidth: 3.0,
                      percent: 0.6,
                      backgroundColor:
                          // AppColors.primaryColor.withOpacity(0.1),
                          (percent < 1)
                              ? AppColors.primaryColor1.withOpacity(0.1)
                              : Colors.green.withOpacity(0.1),
                      progressColor: (percent < 1)
                          ? AppColors.primaryColor1
                          : Colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.timelapse_outlined, color: Colors.red, size: 18),
              Text(
                ' ${DateFormat().add_jm().format(time)}',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              CheckContainer(type: type),
            ],
          )
        ],
      ),
    );
  }
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DateFormat().add_MMMM().format(DateTime.now())} ${DateFormat().add_d().format(DateTime.now())}',
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '10 tasks today',
                    style: TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(90),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withOpacity(0.7),
                  ),
                  child: const Icon(Icons.calendar_month, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => SizedBox(
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    for (int i = 0; i < 7; i++)
                      Expanded(
                        flex: 1,
                        child: itemBuilder(i, weekDays, select.value == i),
                      )
                  ],
                ),
              ),
            )),
        const SizedBox(height: 30),
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
                            color: AppColors.textColor1,
                            fontSize: 12,
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
                          scheduleItem(
                              schedule,
                              i,
                              listColor,
                              getMinBetweenDates(schedule[i]['begin'],
                                      schedule[i]['end']) *
                                  1.0,
                              listIcon,
                              context),
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

  Widget scheduleItem(
      List<Map<String, dynamic>> schedule,
      int i,
      List<Color> listColor,
      double height,
      List<IconData> listIcon,
      BuildContext context) {
    return InkWell(
      onTap: () async {
        int type = checkDateBetween(schedule[i]['begin'], schedule[i]['end']);
        await showDialog(
          useRootNavigator: false,
          barrierColor: Colors.black54,
          context: context,
          builder: (context) {
            // initAll1(element);
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${listMainTitle[schedule[i]['type']]} ',
                          style: const TextStyle(
                            color: AppColors.textColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: listColor[schedule[i]['type']]
                                  .withOpacity(0.5)),
                          child: Icon(listIcon[schedule[i]['type']],
                              color: listColor[schedule[i]['type']]),
                        ),
                      ],
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
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_sharp,
                          color: listColor[schedule[i]['type']],
                        ),
                        Text(
                          ' ${DateFormat().add_jm().format(schedule[i]['begin'])} - ${DateFormat().add_jm().format(schedule[i]['end'])}',
                          style: TextStyle(
                              color: listColor[schedule[i]['type']],
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
                                    : Colors.purple.withOpacity(0.2),
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
                                        : Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
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
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: height > (60 * 2 - 15)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${listMainTitle[schedule[i]['type']]} ',
                        style: const TextStyle(
                          color: AppColors.textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: listColor[schedule[i]['type']]
                                .withOpacity(0.5)),
                        child: Icon(listIcon[schedule[i]['type']],
                            color: listColor[schedule[i]['type']]),
                      ),
                    ],
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
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_sharp,
                        color: listColor[schedule[i]['type']],
                      ),
                      Text(
                        ' ${DateFormat().add_jm().format(schedule[i]['begin'])} - ${DateFormat().add_jm().format(schedule[i]['end'])}',
                        style: TextStyle(
                            color: listColor[schedule[i]['type']],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: listColor[schedule[i]['type']].withOpacity(0.5)),
                    child: Icon(listIcon[schedule[i]['type']],
                        color: listColor[schedule[i]['type']]),
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
                color: AppColors.primaryColor,
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
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weekDays[i],
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  check
                      ? Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
