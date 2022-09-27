import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Templates/Misc/color.dart';

class MessGroupScreen extends StatelessWidget {
  const MessGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listMess = [
      {
        'title': 'Hi Team, I just mode the latest wireform update please check',
        'rs': 0,
        'typeMess': 0,
      },
      {
        'title': 'Wow. I have checked your work. I like it very much ',
        'rs': 1,
        'typeMess': 0,
      },
      {
        'title': 'Ok let\'t do it',
        'rs': 1,
        'typeMess': 0,
      },
      {
        'title': 'assets/images/hoang.png',
        'rs': 0,
        'typeMess': 1,
      },
      {
        'title': 'Hahahahaha it\'t so funny',
        'rs': 0,
        'typeMess': 0,
      },
      {
        'title': 'assets/images/face.png',
        'rs': 1,
        'typeMess': 1,
      },
      {
        'title': 'Let\'t meet tomrrow',
        'rs': 1,
        'typeMess': 0,
      },
      {
        'title': 'We will talk about this project',
        'rs': 1,
        'typeMess': 0,
      }
    ];
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
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {},
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
          ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              LocateTime(
                date: DateTime.now().subtract(
                  const Duration(days: 1),
                ),
              ),
              ...listMess.map((e) => (e['rs'] == 0)
                  ? SendCard(title: e['title'], typeMess: e['typeMess'])
                  : ReciveCard(title: e['title'], typeMess: e['typeMess'])),
              const SizedBox(height: 80),
            ],
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
                              color: AppColors.mainColor,
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
                        onTap: () {},
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

class ReciveCard extends StatelessWidget {
  final String title;
  final int typeMess;
  const ReciveCard({
    Key? key,
    required this.title,
    required this.typeMess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 5),
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/hoang.png',
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.72,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.textColor1.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72 - 90,
                    child: (typeMess == 0)
                        ? Text(
                            title,
                            style: const TextStyle(
                              color: AppColors.textColor1,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Container(
                            width:
                                MediaQuery.of(context).size.width * 0.72 - 90,
                            height:
                                MediaQuery.of(context).size.width * 0.72 - 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  title,
                                ),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.airplane_ticket,
                        size: 20,
                        color: Color.fromARGB(255, 3, 99, 177),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          '19:30',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SendCard extends StatelessWidget {
  final String title;
  final int typeMess;
  const SendCard({
    Key? key,
    required this.title,
    required this.typeMess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.72,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(2),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  (typeMess == 0)
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.72 - 90,
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.72 - 90,
                          height: MediaQuery.of(context).size.width * 0.72 - 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                title,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.airplane_ticket,
                        size: 20,
                        color: Color.fromARGB(255, 3, 99, 177),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          '19:30',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
