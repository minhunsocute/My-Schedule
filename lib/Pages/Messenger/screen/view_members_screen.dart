import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Pages/Messenger/screen/mess_person_screen.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Templates/Misc/color.dart';

class ViewMemberScreen extends StatelessWidget {
  ViewMemberScreen({super.key});
  final List<Map<String, dynamic>> fakeDataMember = [
    {
      'name': 'Nguyen Minh Hung',
      'nickName': 'Hung nguyen',
      'avt': 'assets/images/face.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'nickName': 'Hoang Truong',
      'avt': 'assets/images/hoang.png',
    },
    {
      'name': 'Nguyen Trung hieu',
      'nickName': 'Hieu nguyen',
      'avt': 'assets/images/gmail.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textColor),
        ),
        title: const Text(
          'Team Members (15)',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
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
      backgroundColor: AppColors.mainColor,
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              ...fakeDataMember.map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              e['avt'],
                            ),
                          ),
                          border:
                              Border.all(width: 1, color: AppColors.textColor1),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['name'],
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              e['nickName'],
                              style: const TextStyle(
                                color: AppColors.textColor1,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => Get.to(
                          () => MessPersonScreen(),
                          transition: Transition.rightToLeft,
                        ),
                        child: const Icon(
                          Icons.send,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        _inputField(),
      ]),
    );
  }

  Align _inputField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.textColor1.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        // color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Expanded(child: ButtonMain(title: 'Add Member', press: () {}))
          ],
        ),
      ),
    );
  }
}
