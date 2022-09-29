import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Pages/Messenger/screen/inf_mess_project_screen.dart';
import 'package:my_schedule/Pages/Messenger/screen/widgets/recieve_card.dart';
import 'package:my_schedule/Pages/Messenger/screen/widgets/send_card.dart';

import '../../../Templates/Misc/color.dart';

class MessGroupScreen extends StatelessWidget {
  MessGroupScreen({super.key});
  final TextEditingController messController = TextEditingController();

  @override
  RxList<Map<String, dynamic>> listMess = [
    {
      'title': 'Hi Team, I just mode the latest wireform update please check',
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Wow. I have checked your work. I like it very much ',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Ok let\'t do it',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'assets/images/hoang.png',
      'rs': 0,
      'typeMess': 1,
      'date': DateTime.now(),
    },
    {
      'title': 'Hahahahaha it\'t so funny',
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'assets/images/face.png',
      'rs': 1,
      'typeMess': 1,
      'date': DateTime.now(),
    },
    {
      'title': 'Let\'t meet tomrrow',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'We will talk about this project',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    }
  ].obs;
  void sendMess() {
    listMess.value.add({
      'title': messController.text,
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textColor),
        ),
        title: const Text(
          'Tiki Mobile App',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () => Get.to(
                () => InFMessGroupScreen(),
                transition: Transition.rightToLeft,
              ),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.textColor1.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.more_horiz,
                  color: AppColors.textColor,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
      body: Stack(
        children: <Widget>[
          Obx(
            () => Container(
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  const SizedBox(height: 20),
                  LocateTime(
                    date: DateTime.now().subtract(
                      const Duration(days: 1),
                    ),
                  ),
                  ...listMess.value.map((e) => (e['rs'] == 0)
                      ? SendCard(
                          title: e['title'],
                          typeMess: e['typeMess'],
                          time: e['date'])
                      : ReciveCard(
                          title: e['title'],
                          typeMess: e['typeMess'],
                          time: e['date'])),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          _inputField()
        ],
      ),
    );
  }

  Align _inputField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 70,
        color: AppColors.mainColor,
        // color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textColor1.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: messController,
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          autocorrect: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type Message',
                            hintStyle: TextStyle(
                              color: AppColors.textColor1,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: InkWell(
                        onTap: () => sendMess,
                        child: const Icon(Icons.camera_alt_outlined,
                            color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.send,
                      color: AppColors.textColor,
                      size: 15,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocateTime extends StatelessWidget {
  const LocateTime({
    Key? key,
    required this.date,
  }) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: AppColors.textColor),
        ),
        child: Text(
          (date.year == now.year &&
                  date.month == now.month &&
                  date.day == now.day)
              ? 'Today'
              : DateFormat().add_MEd().format(date),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
