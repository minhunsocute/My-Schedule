import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    'In Progress',
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
            inProgressField(),
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.textColor1.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor.withOpacity(0.2),
                          ),
                          child: SvgPicture.asset('assets/icons/Message.svg',
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox inProgressField() {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          for (int i = 0; i < 5; i++)
            Container(
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: 250,
              decoration: BoxDecoration(
                color: (i % 3 == 0)
                    ? AppColors.primaryColor.withOpacity(0.2)
                    : (i % 2 == 0)
                        ? AppColors.primaryColor1
                        : AppColors.primaryColor2.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Office Project',
                            style: TextStyle(color: AppColors.textColor),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
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
                      const Text(
                        'Grocery shopping app design',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ]),
                  ),
                  const Spacer(),
                  LinearPercentIndicator(
                    lineHeight: 15,
                    percent: 0.5,
                    backgroundColor: (i % 3 == 0)
                        ? AppColors.primaryColor.withOpacity(0.05)
                        : (i % 2 == 0)
                            ? AppColors.primaryColor1.withOpacity(0.5)
                            : AppColors.primaryColor2.withOpacity(0.1),
                    progressColor: (i % 3 == 0)
                        ? AppColors.primaryColor
                        : (i % 2 == 0)
                            ? AppColors.primaryColor1
                            : AppColors.primaryColor2,
                    animation: true,
                    animationDuration: 1000,
                    barRadius: const Radius.circular(20),
                  ),
                ],
              ),
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
