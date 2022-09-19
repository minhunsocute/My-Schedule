import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../Templates/Misc/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            // headerField(),
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
                    onTap: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(color: AppColors.textColor1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            toDayScheduleField(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: const [
                  Text(
                    'Today Deadline',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            todayDeadlineField(widthDevice),
          ],
        ),
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
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: (widthDevice - 80) / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your today\'s task almost done',
                  style: TextStyle(color: AppColors.textColor),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 30,
                  width: 101,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        offset: const Offset(2, 3),
                        blurRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        offset: const Offset(-2, -3),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // ignore: deprecated_member_use
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'View Task',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
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
                          color: Colors.white,
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
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.person,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        const SizedBox(width: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello!',
              style: TextStyle(
                fontWeight: FontWeight.w400,
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
          color: Colors.white,
          height: 25,
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.date,
    required this.title,
    required this.mainTitle,
    required this.type,
  }) : super(key: key);

  final DateTime date;
  final String title;
  final String mainTitle;
  final int type; // 0: to-do , 1: In Progress, 2: Done
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 250,
      decoration: BoxDecoration(
        color: (type == 0)
            ? AppColors.primaryColor.withOpacity(0.2)
            : (type == 1)
                ? AppColors.primaryColor1
                : AppColors.primaryColor2.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      mainTitle,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor.withOpacity(0.2)),
                    child: Image.asset(
                      'assets/images/gmail.png',
                      height: 15,
                      width: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ]),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.access_time_filled_outlined,
                    color: (type == 0)
                        ? AppColors.primaryColor
                        : (type == 1)
                            ? AppColors.primaryColor1
                            : AppColors.primaryColor2),
                Text(
                  ' ${DateFormat().add_jm().format(date)}',
                  overflow: TextOverflow.fade,
                  style:
                      const TextStyle(color: AppColors.textColor, fontSize: 12),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (type == 0)
                          ? AppColors.primaryColor.withOpacity(0.3)
                          : (type == 1)
                              ? AppColors.primaryColor1.withOpacity(0.3)
                              : AppColors.primaryColor2.withOpacity(0.3)),
                  child: Text(
                    type == 0
                        ? 'To-do'
                        : type == 1
                            ? 'In Progress'
                            : 'Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: (type == 0)
                          ? AppColors.primaryColor
                          : (type == 1)
                              ? AppColors.primaryColor1
                              : AppColors.primaryColor2,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeadlineExerciseCard extends StatelessWidget {
  const DeadlineExerciseCard({
    Key? key,
    required this.mainTitle,
    required this.checkComplete,
    required this.deadTime,
  }) : super(key: key);
  final String mainTitle;
  final bool checkComplete;
  final DateTime deadTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textColor1.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.access_time_filled_sharp,
                          color: Colors.red.withOpacity(0.5)),
                      Text(
                        ' ${DateFormat().add_MMMEd().format(deadTime)} / ${DateFormat().add_jm().format(deadTime)}',
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            color: AppColors.textColor1, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (checkComplete)
                      ? Colors.green.withOpacity(0.4)
                      : Colors.red.withOpacity(0.4),
                  border: Border.all(
                    width: 1,
                    color: (checkComplete) ? Colors.green : Colors.red,
                  ),
                ),
                child: Text(
                  (checkComplete) ? 'Done' : 'Undone',
                  style: TextStyle(
                    color: (checkComplete) ? Colors.green : Colors.red,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeadlineProjectCard extends StatelessWidget {
  const DeadlineProjectCard({
    Key? key,
    required this.mainTitle,
    required this.percent,
    required this.deadTime,
  }) : super(key: key);
  final String mainTitle;
  final double percent;
  final DateTime deadTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textColor1.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
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
                  ),
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
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/hoang.png'),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled_sharp,
                            color: Colors.red.withOpacity(0.5)),
                        Text(
                          ' ${DateFormat().add_MMMEd().format(deadTime)} / ${DateFormat().add_jm().format(deadTime)}',
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              color: AppColors.textColor1, fontSize: 12),
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
                        style: const TextStyle(
                          color: AppColors.primaryColor1,
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
          )
        ],
      ),
    );
  }
}
