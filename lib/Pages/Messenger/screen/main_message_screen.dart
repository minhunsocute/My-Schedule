import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Templates/Misc/color.dart';
import 'mess_group_screen.dart';
import 'mess_person_screen.dart';

class MainMessageScreen extends StatelessWidget {
  const MainMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.message, color: AppColors.primaryColor),
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
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
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: AppColors.textColor1.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.search, color: AppColors.textColor1),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RowMessPerson(
              imagePath: 'assets/images/hoang.png',
              name: 'Truong Huynh Duc Hoang',
              date: DateTime.now(),
              lastMess: 'Wow this really epic',
              press: () => Get.to(() => MessPersonScreen(),
                  transition: Transition.rightToLeft)),
          RowMessPerson(
              imagePath: 'assets/images/face.png',
              name: 'Nguyen Minh Hung',
              date: DateTime.now(),
              lastMess: 'Wow this really epic',
              press: () => Get.to(() => MessPersonScreen(),
                  transition: Transition.rightToLeft)),
          RowMessGroup(
            name: 'Mobile Group',
            lastMess: 'Wow this realy epic',
            time: DateTime.now(),
            press: () => Get.to(() => MessGroupScreen(),
                transition: Transition.rightToLeft),
            listMems: const [
              {
                'name': 'Nguyen Minh Hung',
                'image': 'assets/images/face.png',
              },
              {
                'name': 'Truong Huynh Duc Hoang',
                'image': 'assets/images/hoang.png',
              },
              {
                'name': 'Truong Huynh Duc Hoang',
                'image': 'assets/images/to-do-list.png',
              },
              {
                'name': 'Truong Huynh Duc Hoang',
                'image': 'assets/images/hoang.png',
              }
            ],
          ),
        ],
      ),
    );
  }
}

class RowMessGroup extends StatelessWidget {
  final String name;
  final String lastMess;
  final DateTime time;
  final Function() press;
  final List<Map<String, dynamic>> listMems;
  const RowMessGroup({
    Key? key,
    required this.name,
    required this.lastMess,
    required this.time,
    required this.listMems,
    required this.press,
  }) : super(key: key);

  @override
  int get length => listMems.length > 2 ? 2 : listMems.length;
  List<String> get listImage => [for (var item in listMems) item['image']];
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuiltImageGroup(
              size: 60,
              listImage: listImage,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: Get.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    lastMess,
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        for (int i = 0; i < length; i++)
                          Container(
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(left: (14 * (i + 1)) * 1.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(listMems[i]['image']),
                              ),
                            ),
                          ),
                        (listMems.length > 2)
                            ? Container(
                                width: 18,
                                height: 18,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(left: (14 * 3) * 1.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.textColor1,
                                ),
                                child: Text(
                                  '+${listMems.length - 2}',
                                  style: const TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                            : Container(),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.airplane_ticket,
                      size: 14,
                      color: Color.fromARGB(255, 3, 99, 177),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        DateFormat().add_jm().format(time),
                        style: const TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuiltImageGroup extends StatelessWidget {
  final double size;
  final List<String> listImage;
  const BuiltImageGroup({
    super.key,
    required this.size,
    required this.listImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.textColor1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
                image: DecorationImage(
                  image: AssetImage(listImage[0]),
                ),
              ),
            ),
          ),
          (listImage.length == 2)
              ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.textColor1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: AssetImage(listImage[0]),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.textColor1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.textColor1),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(i == 0 ? 100 : 0),
                                    bottomRight:
                                        Radius.circular(i == 1 ? 100 : 0)),
                                image: DecorationImage(
                                  image: AssetImage(listImage[1 + i]),
                                ),
                              ),
                            ),
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

class RowMessPerson extends StatelessWidget {
  final String imagePath;
  final String name;
  final DateTime date;
  final Function() press;
  final String lastMess;
  const RowMessPerson({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.date,
    required this.lastMess,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
                border: Border.all(width: 1, color: AppColors.textColor1),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: Get.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    lastMess,
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.airplane_ticket,
                  size: 14,
                  color: Color.fromARGB(255, 3, 99, 177),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    DateFormat().add_jm().format(date),
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
