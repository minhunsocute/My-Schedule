import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;
import '../../../Templates/Misc/color.dart';
import '../widgets/child_task_item.dart';
import '../widgets/list_member_quick_view.dart';
import '../widgets/parent_task_item.dart';

class ViewAllTaskOfProjectScreen extends StatelessWidget {
  const ViewAllTaskOfProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widthDevice,
            height: heightDevice / 4,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.yellow,
                  Colors.blue,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Get.back(),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/Search.svg',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.more_horiz, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/app_icon.png',
                        height: 60.0, width: 60.0),
                    ListMemberQuickView(
                      size: 30.0,
                      listImage: const [
                        'assets/images/hoang.png',
                        'assets/images/face.png',
                        'assets/images/google.png',
                        'assets/images/hoang.png',
                        'assets/images/hoang.png'
                      ],
                      length: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Tiki Mobile App Project',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'UI Kit Design Project for Task. Notes and Remider Mobile App - December 20,2024',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 15.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[200]!,
                      Colors.blue[500]!,
                    ],
                  ),
                ),
                child: const Text(
                  '80 / 90',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                '8 Days Left, Dec 22 2024',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: double.infinity,
              height: 7,
              child: LinearPercentIndicator(
                lineHeight: 8,
                percent: 0.4,
                progressColor: AppColors.primaryColor,
                backgroundColor: Colors.grey.withOpacity(0.2),
                animation: true,
                animationDuration: 1000,
                barRadius: const Radius.circular(20),
              ),
            ),
          ),
          _listTaskField(heightDevice, widthDevice),
        ],
      ),
    );
  }

  SizedBox _listTaskField(double heightDevice, double widthDevice) {
    return SizedBox(
      width: double.infinity,
      height: heightDevice / 1.2,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              width: widthDevice / 1.45,
              height: heightDevice,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors.primaryColor.withOpacity(0.1),
              ),
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      'To-do',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          width: 2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: const Text(
                        '6',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.add_circle_sharp,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ParentTaskItem(),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView(
                    children: [
                      for (int i = 0; i < 2; i++) const ChildTaskItem(),
                    ],
                  ),
                ),
              ]),
            ),
        ],
      ),
    );
  }
}
