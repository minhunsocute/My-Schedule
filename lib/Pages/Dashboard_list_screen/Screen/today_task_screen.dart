import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/task_exercise_card.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/task_project_card.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/pub_dev/calender_setup.dart';

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
