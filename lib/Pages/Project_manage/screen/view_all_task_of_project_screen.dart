import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;
import '../../../Templates/Misc/color.dart';

class ViewAllTaskOfProjectScreen extends StatelessWidget {
  const ViewAllTaskOfProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: widthDevice,
              height: heightDevice / 3.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.blue,
                  ],
                ),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
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
      ),
    );
  }

  SizedBox _listTaskField(double heightDevice, double widthDevice) {
    return SizedBox(
      width: double.infinity,
      height: heightDevice,
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
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, top: 20),
                      width: widthDevice / 1.45 - 60.0,
                      height: widthDevice / 1.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.primaryColor.withOpacity(0.1),
                      ),
                    ),
                    Transform.rotate(
                      angle: math.pi / 15,
                      child: Container(
                        margin: const EdgeInsets.only(left: 35.0),
                        padding: const EdgeInsets.all(15.0),
                        width: widthDevice / 1.45 - 60.0,
                        height: widthDevice / 1.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 5.0)
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Build Wirframge',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        'Due Date: Dec 24, 2022',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.more_horiz,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              width: double.infinity,
                              height: widthDevice / 1.6 / 2.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 5.0)
                                ],
                                gradient: const LinearGradient(
                                  colors: [Colors.red, Colors.blue],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    for (int i = 0; i <= 2; i++)
                                      Container(
                                        width: 24,
                                        height: 24,
                                        margin: EdgeInsets.only(
                                            left: (14 * i) * 1.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/hoang.png'),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          left: (14 * 3) * 1.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mainColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        '+2',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/Message.svg'),
                                      const Text(
                                        ' 8',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      SvgPicture.asset(
                                          'assets/icons/Notification.svg'),
                                      const Text(
                                        ' 4',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5.0)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Build Wirframge',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Due Date: Dec 24, 2022',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              for (int i = 0; i <= 2; i++)
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(left: (14 * i) * 1.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/hoang.png'),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(left: (14 * 3) * 1.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.mainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  '+2',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset('assets/icons/Message.svg'),
                                const Text(
                                  ' 8',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                SvgPicture.asset(
                                    'assets/icons/Notification.svg'),
                                const Text(
                                  ' 4',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
