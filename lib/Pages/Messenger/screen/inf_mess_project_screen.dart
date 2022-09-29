import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Messenger/screen/widgets/build_image_group.dart';

import '../../../Templates/Misc/color.dart';
import 'view_members_screen.dart';

class InFMessGroupScreen extends StatelessWidget {
  InFMessGroupScreen({super.key});
  bool val = false;
  final List<Map<String, dynamic>> fakeDataMems = [
    {
      'name': 'Nguyen Minh Hung',
      'avt': 'assets/images/face.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'avt': 'assets/images/hoang.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'avt': 'assets/images/gmail.png',
    },
    {
      'name': 'Nguyen Minh Hung',
      'avt': 'assets/images/intro1.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'avt': 'assets/images/intro2.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'avt': 'assets/images/intro3.png',
    },
    {
      'name': 'Nguyen Minh Hung',
      'avt': 'assets/images/face.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'avt': 'assets/images/hoang.png',
    },
    {
      'name': 'Truong Huynh Duc Hoang',
      'avt': 'assets/images/gmail.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textColor),
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
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                BuiltImageGroup(
                  size: 130,
                  listImage: [for (var item in fakeDataMems) item['avt']],
                ),
                Positioned(
                  top: 100,
                  left: 100,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryColor.withOpacity(0.9)),
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.textColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tiki Mobile Projecy ',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.edit, color: AppColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person_add,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Add',
                        style: TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 40,
                width: 1,
                color: AppColors.textColor1,
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 0.5,
            color: AppColors.textColor1.withOpacity(0.7),
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Group Description',
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async => await showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => ViiewPhotosInChat(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: const [
                        Hero(
                          tag: 'media,links and docs tag',
                          child: Text(
                            'Media,Links and Docs....',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 0.5,
            color: AppColors.textColor1.withOpacity(0.7),
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.notifications_active,
                      color: AppColors.textColor,
                    ),
                    const Text(
                      ' Mute Notifications',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    ToggleButtonIos(val: val)
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.settings,
                          color: AppColors.textColor,
                        ),
                        Text(
                          ' Group Settings',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 0.5,
            color: AppColors.textColor1.withOpacity(0.7),
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: const Icon(
                    Icons.person_add,
                    color: AppColors.textColor,
                    size: 17,
                  ),
                ),
                const Text(
                  ' Add Team Members',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.to(
                    () => ViewMemberScreen(),
                    transition: Transition.rightToLeft,
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.textColor1.withOpacity(0.4)),
                    child: const Text(
                      'View',
                      style: TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 15),
                ...fakeDataMems.map(
                  (e) => Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: AppColors.textColor1),
                      image: DecorationImage(
                        image: AssetImage(
                          e['avt'],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        Text(
                          ' Exit Group',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text(
                          ' Delete Group',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ViiewPhotosInChat extends StatelessWidget {
  ViiewPhotosInChat({
    Key? key,
  }) : super(key: key);
  List<String> fakeDataImage = [
    'assets/images/hoang.png',
    'assets/images/face.png',
    'assets/images/intro1.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png',
    'assets/images/gmail.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        title: const Text(
          'Media,Links and Docs....',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const Divider(
            color: AppColors.textColor1,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: Get.height,
            width: double.infinity,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                ...fakeDataImage.map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: AppColors.textColor1,
                      ),
                      image: DecorationImage(
                        image: AssetImage(e),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ToggleButtonIos extends StatefulWidget {
  ToggleButtonIos({Key? key, required this.val}) : super(key: key);
  bool val;
  @override
  State<ToggleButtonIos> createState() => _ToggleButtonIosState();
}

class _ToggleButtonIosState extends State<ToggleButtonIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: AppColors.primaryColor,
      value: widget.val,
      onChanged: (bool value) async {
        widget.val = value;
        setState(() {});
      },
    );
  }
}
