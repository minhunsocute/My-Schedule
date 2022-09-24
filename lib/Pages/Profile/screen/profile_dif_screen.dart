import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class ProfileDiffScreen extends StatelessWidget {
  const ProfileDiffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Over(
        widthDevice: widthDevice,
        heightDevice: heightDevice,
        listView: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(50),
                      //   bottomRight: Radius.circular(50),
                      // ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.textColor1.withOpacity(0.3),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.textColor1.withOpacity(0.3),
                              ),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.mainColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  offset: const Offset(-2, 3),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 140,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.textColor1.withOpacity(0.4),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/hoang.png'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            offset: const Offset(-2, 3),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Truong Huynh Duc Hoang',
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Text(
                                            'UI/UX Designer',
                                            style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              const Text(
                                                ' Age: 23',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              const Text(
                                                ' Skill: C#, C++, Dart,Java',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              const Text(
                                                ' Description: Funny, Hard Core',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.more_horiz,
                                        color: AppColors.textColor1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //     height: 400,
            //     width: double.infinity,
            //     child: HeatMap(
            //       datasets: {
            //         DateTime.now(): 3,
            //         DateTime.now().add(const Duration(days: 1)): 7,
            //         DateTime.now().add(const Duration(days: 2)): 10,
            //         DateTime.now().add(const Duration(days: 3)): 13,
            //         DateTime.now().add(const Duration(days: 1)): 6,
            //       },
            //       colorMode: ColorMode.opacity,
            //       showText: false,
            //       scrollable: true,
            //       colorsets: {
            //         1: Colors.red,
            //         3: Colors.orange,
            //         5: Colors.yellow,
            //         7: Colors.green,
            //         9: Colors.blue,
            //         11: Colors.indigo,
            //         13: Colors.purple,
            //       },
            //       onClick: (value) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(content: Text(value.toString())));
            //       },
            //     ))
            const SizedBox(
              height: 400,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}

class Over extends StatelessWidget {
  const Over({
    Key? key,
    required this.widthDevice,
    required this.heightDevice,
    required this.listView,
  }) : super(key: key);

  final double widthDevice;
  final double heightDevice;
  final Column listView;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widthDevice,
          height: heightDevice,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: heightDevice / 2,
                  color: AppColors.primaryColor,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: heightDevice / 2,
                  color: AppColors.mainColor,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: heightDevice),
                      child: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: AppColors.mainColor,
                          ),
                          child: listView),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
