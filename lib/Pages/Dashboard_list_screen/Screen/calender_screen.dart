import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Templates/Misc/color.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});
  RxInt select = 0.obs;
  String convertTime(int value) {
    return '${value >= 12 ? value - 12 : value}:00 ${value >= 12 ? 'PM' : 'AM'}';
  }

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Todays Schedule',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: const SizedBox(width: 60),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage('assets/images/face.png')),
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateFormat().add_MMMM().format(DateTime.now())} ${DateFormat().add_d().format(DateTime.now())}',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '10 tasks today',
                      style: TextStyle(
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(90),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.7),
                    ),
                    child:
                        const Icon(Icons.calendar_month, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: [
                      for (int i = 0; i < 7; i++)
                        Expanded(
                          flex: 1,
                          child: itemBuilder(i, weekDays, select.value == i),
                        )
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 3),
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
              ),
              Expanded(
                child: Container(height: 1, color: AppColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 1500,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      for (int i = 0; i < 24; i++)
                        Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: Text(
                            convertTime(i),
                            style: const TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 12,
                            ),
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
    );
  }

  Widget itemBuilder(int i, List<String> weekDays, bool check) {
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () {
        select.value = i;
      },
      child: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 500),
              alignment: Alignment.center,
              height: (check) ? 100 : 0,
              width: check ? 50 : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: const Offset(2, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (i + 10).toString(),
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weekDays[i],
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  check
                      ? Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
