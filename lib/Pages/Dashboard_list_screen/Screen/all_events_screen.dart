// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    print(selectedEvents);
    // selectedEvents = {
    //   DateTime.now(): [Event(title: 'OKe')],
    // };
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
                                ? 'assets/images/app_icon.png'
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
        ...getEventsfromDay(selectedDay).map(
          (e) => EventsExCard(data: e),
        ),
      ],
    );
  }
}

class EventsExCard extends StatelessWidget {
  const EventsExCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Event data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.mainColor,
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10.0)
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/app_icon1.png',
                          height: constraints.maxWidth / 1.2,
                          width: constraints.maxWidth,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: AppColors.primaryColor,
                            ),
                            child: Text(
                              DateFormat().add_jm().format(data.time),
                              style: const TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.0,
                              ),
                            )),
                      ],
                    ),
                  )),
              Container(
                width: 0.5,
                height: double.infinity,
                color: Colors.black,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.description,
                            maxLines: 3,
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: data.check
                                ? Colors.green[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            data.check ? 'Completed' : 'Un Completed',
                            style: TextStyle(
                              color: data.check ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/app_icon2.png',
            height: 50.0,
            width: 50.0,
          ),
        ),
      ],
    );
  }
}
