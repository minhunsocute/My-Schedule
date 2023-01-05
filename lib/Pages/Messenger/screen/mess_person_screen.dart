import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Templates/Misc/color.dart';
import 'mess_group_screen.dart';
import 'widgets/recieve_card.dart';
import 'widgets/send_card.dart';

class MessPersonScreen extends StatelessWidget {
  MessPersonScreen({super.key});
  final TextEditingController messController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 10,
        bottomOpacity: 10.0,
        backgroundColor: AppColors.mainColor,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.textColor,
              size: 18,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              'Truong Huynh Duc Hoang',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Your friend',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textColor1,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/hoang.png',
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 5.0)
                    ]),
              ),
              Positioned(
                top: 7.0,
                left: 42.0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColors.greyBackground,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DateFormat().add_yMMM().format(DateTime.now()),
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SendCard(
                  title: 'Hello ! Annal Today',
                  check: false,
                  typeMess: 0,
                  imageMess: '',
                ),
                SendCard(
                  title:
                      'Hello ! Annal Today Hello ! Annal Today Hello ! Annal Toda ay Hello ! Annal Today',
                  check: false,
                  imageMess: '',
                  typeMess: 0,
                ),
                SendCard(
                  title: 'Hinh Dep nhi',
                  check: true,
                  imageMess: 'assets/images/hoang.png',
                  typeMess: 1,
                ),
                RecCard(
                  title: 'Hello ! Annal Today',
                  avt: 'assets/images/hoang.png',
                  check: false,
                  typeMess: 0,
                  imageMess: '',
                ),
                RecCard(
                  title: 'Hinh dep qua la dep luon',
                  avt: 'assets/images/hoang.png',
                  check: true,
                  typeMess: 1,
                  imageMess: 'assets/images/hoang.png',
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
          _inputField(),
        ],
      ),
    );
  }

  Align _inputField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.mainColor,
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10.0)
            ]),
        // color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  hintStyle: TextStyle(
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.primaryColor,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 10.0)
                      ]),
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/icons/Message.svg',
                    height: 10,
                    width: 10,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
