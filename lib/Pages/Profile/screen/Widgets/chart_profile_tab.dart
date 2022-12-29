import 'package:flutter/material.dart';
import 'package:my_schedule/Pages/Profile/screen/Widgets/task_data_row.dart';

import '../../../../Templates/Misc/color.dart';
import '../../../../Widgets/line_chart_2_line.dart';

class ChartProfileTab extends StatelessWidget {
  const ChartProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Commit Board',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: const Text(
                    'Select Week',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          color: AppColors.mainColor,
          child: const Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 6,
                top: 5.0,
                bottom: 5.0,
              ),
              child: LineChart2Line(isShowingMainData: true)),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: const [
              Text(
                'Task View',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.3,
              color: AppColors.mainColor,
              child: Row(
                children: [
                  _doneListField(true),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 1,
                    height: double.infinity,
                    color: AppColors.primaryColor,
                  ),
                  _doneListField(false),
                ],
              ),
            ),
            Positioned(
              top: -30,
              left: (MediaQuery.of(context).size.width - 60.0) / 8,
              child: Image.asset(
                'assets/images/app_icon.png',
                height: 60.0,
                width: 60.0,
              ),
            ),
            Positioned(
              top: -30,
              right: (MediaQuery.of(context).size.width - 60.0) / 8,
              child: Image.asset(
                'assets/images/app_icon1.png',
                height: 60.0,
                width: 60.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }

  Expanded _doneListField(bool check) {
    return Expanded(
      child: ListView(children: [
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: AppColors.textColor),
              children: [
                const TextSpan(
                  text: '100',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' tasks (${check ? 'done' : 'todo'})',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const Divider(thickness: 1),
        TaskDataRow(title: 'Windows Dev', time: DateTime.now(), check: check),
        TaskDataRow(title: 'Windows Dev', time: DateTime.now(), check: check),
        TaskDataRow(title: 'Windows Dev', time: DateTime.now(), check: check),
      ]),
    );
  }
}
