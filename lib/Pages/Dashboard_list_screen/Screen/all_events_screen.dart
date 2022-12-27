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
  final DateTime time;
  Event(
      {required this.type,
      required this.time,
      required this.description,
      required this.location,
      required this.title});
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
      ),
      Event(
        type: 1,
        time: DateTime.now(),
        description: '',
        location: '',
        title: 'Special Day',
      ),
      Event(
        type: 2,
        time: DateTime.now(),
        description: '',
        location: ' Ho Chi Minh City, University of Sciece',
        title: 'IT Festival ',
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

          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
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
            },
            prioritizedBuilder: ((context, day, focusedDay) => Center(
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/app_icon.png'))),
                        ),
                      ),
                    ],
                  ),
                )),
          ),

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
          headerStyle: HeaderStyle(
            leftChevronIcon:
                const Icon(Icons.chevron_left, color: AppColors.textColor),
            rightChevronIcon:
                const Icon(Icons.chevron_right, color: AppColors.textColor),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            formatButtonVisible: true,
            titleCentered: true,
            formatButtonShowsNext: false,
            formatButtonDecoration: BoxDecoration(
              color: Colors.redAccent[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            formatButtonTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // daysOfWeekStyle: TextStyle(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            const Text(
              'Events',
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
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                    ],
                  )),
            ),
          ]),
        ),
        const SizedBox(height: 15.0),
        ...getEventsfromDay(selectedDay).map(
          (e) => (e.type == 0)
              ? EventsExCard(data: e)
              : e.type == 1
                  ? EventSDCard(
                      data: e,
                    )
                  : EventRPCard(data: e),
        ),
      ],
    );
  }
}

class EventRPCard extends StatelessWidget {
  const EventRPCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Event data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Relax,Play time',
                style: TextStyle(
                  color: AppColors.textColor,
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
                  Icons.tag_faces_rounded,
                  color: AppColors.primaryColor1,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
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
              const Icon(Icons.timelapse_outlined,
                  color: AppColors.primaryColor1, size: 18),
              Text(
                ' ${DateFormat().add_jm().format(data.time)}',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              // CheckContainer(type: type),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.location_on,
                  color: AppColors.primaryColor1, size: 18),
              Text(
                ' ${data.location}',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Container(),
              // CheckContainer(type: type),
            ],
          ),
        ],
      ),
    );
  }
}

class EventSDCard extends StatelessWidget {
  const EventSDCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Event data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Special Day',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.cake,
                  color: Colors.redAccent,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.timelapse_outlined,
                  color: Colors.redAccent, size: 18),
              Text(
                ' ${DateFormat().add_MMMEd().format(data.time)}',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Exams and presentations',
                style: TextStyle(
                  color: AppColors.textColor,
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
                  Icons.school,
                  color: Colors.green,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                height: 7,
                width: 7,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  data.description,
                  style: const TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.timelapse_outlined,
                  color: AppColors.primaryColor2, size: 18),
              Text(
                ' ${DateFormat().add_jm().format(data.time)}',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              // CheckContainer(type: type),
            ],
          )
        ],
      ),
    );
  }
}
