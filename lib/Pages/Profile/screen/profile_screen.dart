import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Pages/Profile/screen/profile_dif_screen.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:badges/badges.dart';

import 'Widgets/github_calender_built.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  List<Map<String, dynamic>> fakeDataCommit = [
    {
      'time': DateTime.now().subtract(const Duration(days: 8)),
      'commit': 2,
    },
    {
      'time': DateTime.now().subtract(const Duration(days: 7)),
      'commit': 2,
    },
    {
      'time': DateTime.now(),
      'commit': 2,
    },
    {
      'time': DateTime.now().subtract(const Duration(days: 2)),
      'commit': 2,
    },
    {
      'time': DateTime.now().add(const Duration(days: 20)),
      'commit': 2,
    },
    {
      'time': DateTime.now().add(const Duration(days: 1)),
      'commit': 15,
    },
    {
      'time': DateTime.now().add(const Duration(days: 2)),
      'commit': 6,
    },
    {
      'time': DateTime.now().add(const Duration(days: 3)),
      'commit': 7,
    },
    {
      'time': DateTime.now().add(const Duration(days: 4)),
      'commit': 3,
    },
    {
      'time': DateTime.now().add(const Duration(days: 5)),
      'commit': 4,
    },
    {
      'time': DateTime.now().add(const Duration(days: 6)),
      'commit': 10,
    },
    {
      'time': DateTime.now().add(const Duration(days: 88)),
      'commit': 18,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Over(
        widthDevice: Get.width,
        heightDevice: Get.height,
        listView: Column(
          children: [
            _headerField(),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.textColor1.withOpacity(0.4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Activity Chart View',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          // await _showDatePicker(context: context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                          child: const Text(
                            'Select',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GitHubCalenderBuit(fakeDataCommit: fakeDataCommit)

                  // gitHubCommitField()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _headerField() {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 100),
              SizedBox(
                child: Column(
                  children: [
                    Badge(
                      position: BadgePosition.topStart(
                        top: -45,
                        start: (Get.mediaQuery.size.width - 40) / 2 - 45,
                      ),
                      badgeColor: AppColors.textColor1.withOpacity(0.3),
                      padding: const EdgeInsets.all(10),
                      stackFit: StackFit.passthrough,
                      elevation: 0,
                      badgeContent: Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/hoang.png',
                            ),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            decoration: BoxDecoration(
                              color: AppColors.textColor1.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Nguyen Minh Hung',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    '27',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Projects',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.textColor1,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 17,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 1,
                                              color: AppColors.textColor,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    '759',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Tasks',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.textColor1,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 17,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 1,
                                              color: AppColors.textColor,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    '35',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Groups',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.textColor1,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 17,
                                                    ),
                                                  )
                                                ],
                                              ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
