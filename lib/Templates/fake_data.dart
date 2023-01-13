import 'package:flutter/material.dart';

import 'Misc/color.dart';

DateTime now = DateTime.now();

List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

List<Map<String, dynamic>> schedule = [
  {
    'begin': DateTime(now.year, now.month, now.day, 0, 0, 0, 0),
    'end': DateTime(now.year, now.month, now.day, 0, 0, 0, 0),
    'type': -1,
    'title': 'Sleeping time',
    'done': -1,
  },
  {
    'begin': DateTime(now.year, now.month, now.day, 3, 0, 0, 0),
    'end': DateTime(now.year, now.month, now.day, 6, 0, 0, 0),
    'type': 0,
    'title': 'Flutter Coding project',
    'done': 0,
  },
  {
    'begin': DateTime(now.year, now.month, now.day, 9, 0, 0, 0),
    'end': DateTime(now.year, now.month, now.day, 12, 0, 0, 0),
    'type': 1,
    'title': 'Have lunch',
  },
  {
    'begin': DateTime(now.year, now.month, now.day, 13, 0, 0, 0),
    'end': DateTime(now.year, now.month, now.day, 15, 0, 0, 0),
    'type': 2,
    'title': 'Go to School',
  },
  {
    'begin': DateTime(now.year, now.month, now.day, 18, 0, 0, 0),
    'end': DateTime(now.year, now.month, now.day, 19, 0, 0, 0),
    'type': 2,
    'title': 'Learn Ielts in PMP center',
  },
];
List<Color> listColor = [
  Color.fromARGB(157, 157, 255, 255),
  Colors.green,
  AppColors.primaryColor,
];
List<IconData> listIcon = [
  Icons.computer,
  Icons.school,
  Icons.work,
];
List<String> listMainTitle = [
  'Coding time',
  'Working time',
  'Learning time',
];

class Data {
  final String name;
  final double percents;
  final Color color;
  final String imagePath;
  Data(
      {required this.imagePath,
      required this.name,
      required this.percents,
      required this.color});
}

List<Gradient> listGradinet = [
  const LinearGradient(
    colors: [Colors.yellow, Colors.purple],
  ),
  const LinearGradient(
    colors: [Colors.red, Colors.blue],
  ),
  const LinearGradient(
    colors: [Colors.pink, Colors.orange],
  ),
  const LinearGradient(
    colors: [Colors.green, Colors.blue],
  ),
  const LinearGradient(
    colors: [Colors.purple, Colors.orange],
  ),
  const LinearGradient(
    colors: [Colors.yellow, Colors.red],
  ),
];

List<Data> data = [
  Data(
      name: 'now',
      percents: (30.1 / 80.1 * 100).round().toDouble(),
      color: AppColors.primaryColor,
      imagePath: 'assets/images/work-process.png'),
  Data(
    name: '',
    percents: (20 / 80.1 * 100).round().toDouble(),
    color: AppColors.primaryColor1,
    imagePath: 'assets/images/to-do-list.png',
  ),
  Data(
    name: '',
    percents: (30 / 80.1 * 100).round().toDouble(),
    color: AppColors.primaryColor2,
    imagePath: 'assets/images/checked.png',
  ),
];
