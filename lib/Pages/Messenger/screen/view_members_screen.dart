import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
        _buttonField(context),
      ]),
    );
  }

  Align _buttonField(BuildContext context) {
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
            Expanded(
                child: ButtonMain(
              title: 'Add Member',
              press: () async => await showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => AppMemsBerGroupChatScreen(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class AppMemsBerGroupChatScreen extends StatefulWidget {
  AppMemsBerGroupChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppMemsBerGroupChatScreen> createState() =>
      _AppMemsBerGroupChatScreenState();
}

class _AppMemsBerGroupChatScreenState extends State<AppMemsBerGroupChatScreen> {
  final TextEditingController searchController = TextEditingController();

  RxList<Map<String, dynamic>> listMemsAdd = <Map<String, dynamic>>[].obs;

  List<Map<String, dynamic>> allUser = [
    {
      'name': 'Nguyen Minh Hung',
      'nickName': 'Hung nguyen',
      'avt': 'assets/images/face.png',
      'id': 0,
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'nickName': 'Hoang Truong',
      'avt': 'assets/images/hoang.png',
      'id': 1,
    },
    {
      'name': 'Nguyen Trung hieu',
      'nickName': 'Hieu nguyen',
      'avt': 'assets/images/gmail.png',
      'id': 2,
    }
  ];

  void addMem(Map<String, dynamic> item) {
    setState(() {
      // if (allUser.contains(item)) {
      //   return;
      // }
      listMemsAdd.value.add(item);
    });
  }

  String getLastName(String name) {
    String lastName = "";
    String firstName = "";
    lastName = name.substring(name.lastIndexOf(" ") + 1);
    return lastName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Add Member',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: const [
                  Icon(Icons.people, color: AppColors.primaryColor, size: 18),
                  Text(
                    ' All User to Add',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => (listMemsAdd.value.isNotEmpty)
                  ? Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.textColor1.withOpacity(0.2),
                      ),
                      child: Wrap(
                        children: [
                          ...listMemsAdd.value.map(
                            (e) => Container(
                              width: 100,
                              padding: const EdgeInsets.all(5.0),
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.mainColor),
                              child: Row(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          e['avt'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  SizedBox(
                                    width: 50,
                                    child: Text(
                                      getLastName(e['name']),
                                      style: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close,
                                      color: AppColors.textColor,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.textColor1.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person_add, color: AppColors.primaryColor),
                          Text(
                            ' Add Member',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            const Divider(color: AppColors.textColor1),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.textColor1.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.search, color: AppColors.textColor),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ...allUser.map(
              (e) => Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.textColor1),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(e['avt']),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['name'],
                        style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        e['nickName'],
                        style: const TextStyle(
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => addMem(e),
                    icon: const Icon(
                      Icons.person_add,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
