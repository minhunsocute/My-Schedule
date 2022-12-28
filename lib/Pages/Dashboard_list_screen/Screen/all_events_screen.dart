// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/widgets/event_ex_card.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Templates/Misc/color.dart';

class Event {
  final String title;
  final int type;
  final String description;
  final String location;
  final bool check;
  final DateTime time;
  Event(
      {required this.type,
      required this.time,
      required this.description,
      required this.location,
      required this.title,
      required this.check});
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

DateTime now = DateTime.now();

class _EventsScreenState extends State<EventsScreen> {
  late Map<String, List<Event>> selectedEvents = {
    '${now.year}/${now.month}/${now.day}': [
      Event(
        type: 0,
        time: DateTime.now(),
        description:
            'The final exam will be held at 7:30 am, in room A202 at the School of Natural Sciences',
        location: '',
        title: 'Windows Develop Exam',
        check: true,
      ),
      Event(
        type: 1,
        time: DateTime.now(),
        description: 'Oke oke oke oke oke ooke',
        location: '',
        title: 'Special Day',
        check: true,
      ),
      Event(
        type: 2,
        time: DateTime.now(),
        description: 'Js java  C# C++',
        location: ' Ho Chi Minh City, University of Sciece',
        title: 'IT Festival ',
        check: false,
      )
    ],
    '${now.year}/${now.month}/${now.day - 1}': [
      Event(
        type: 0,
        time: DateTime.now(),
        description:
            'The final exam will be held at 7:30 am, in room A202 at the School of Natural Sciences',
        location: '',
        title: 'Windows Develop Exam',
        check: true,
      ),
      Event(
        type: 1,
        time: DateTime.now(),
        description: 'Oke oke oke oke oke ooke',
        location: '',
        title: 'Special Day',
        check: true,
      ),
    ],
    '${now.year}/${now.month}/${now.day - 2}': [
      Event(
        type: 0,
        time: DateTime.now(),
        description:
            'The final exam will be held at 7:30 am, in room A202 at the School of Natural Sciences',
        location: '',
        title: 'Windows Develop Exam',
        check: true,
      ),
      Event(
        type: 1,
        time: DateTime.now(),
        description: 'Oke oke oke oke oke ooke',
        location: '',
        title: 'Special Day',
        check: true,
      ),
    ],
  };
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  bool checkIsSameDate(DateTime date1, DateTime date2) =>
      (date1.year == date2.year &&
          date1.month == date2.month &&
          date1.day == date2.day);
  @override
  void initState() {
    super.initState();
  }

  List<Event> getEventsfromDay(DateTime date) {
    String time = '${date.year}/${date.month}/${date.day}';
    return selectedEvents[time] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        TableCalendar(
          rowHeight: 60.0,
          daysOfWeekHeight: 30.0,
          focusedDay: selectedDay,
          firstDay: DateTime(1990),
          lastDay: DateTime(2050),
          calendarFormat: format,
          headerVisible: false,
          calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
            final text = DateFormat.E().format(day);

            return Center(
              child: Text(
                text,
                style: TextStyle(
                  color: day.day == DateTime.sunday ||
                          day.weekday == DateTime.saturday
                      ? AppColors.primaryColor
                      : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            );
          }, //app_icon1.png
              prioritizedBuilder: ((context, day, focusedDay) {
            final key = '${day.year}/${day.month}/${day.day}';
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: checkIsSameDate(day, focusedDay)
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: checkIsSameDate(day, focusedDay)
                            ? Colors.white
                            : AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            (!checkIsSameDate(day, DateTime.now()))
                                ? selectedEvents.containsKey(key)
                                    ? 'assets/images/app_icon.png'
                                    : 'assets/images/app_icon3.png'
                                : 'assets/images/app_icon1.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),

          onFormatChanged: (CalendarFormat _format) {
            setState(() {
              format = _format;
            });
          },
          startingDayOfWeek: StartingDayOfWeek.sunday,
          daysOfWeekVisible: true,

          //Day Changed
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
          eventLoader: getEventsfromDay,

          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            weekendStyle: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          // daysOfWeekStyle: TextStyle(),
        ),
        const SizedBox(height: 10.0),
        const Divider(thickness: 1),
        const SizedBox(height: 10.0),
        (getEventsfromDay(selectedDay).isEmpty)
            ? Center(
                child: Container(
                  width: double.infinity,
                  height: 150.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.mainColor,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        fit: BoxFit.cover,
                        'assets/images/app_icon3.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      const Text(
                        'No active today',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  ...getEventsfromDay(selectedDay).map(
                    (e) => EventsExCard(data: e),
                  ),
                ],
              ),
      ],
    );
  }
}

//-------------Widget---------------------------
