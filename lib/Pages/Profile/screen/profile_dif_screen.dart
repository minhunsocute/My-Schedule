import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Pages/Profile/controller/profile_dif_controller.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:my_schedule/Templates/fake_data.dart';
import 'package:my_schedule/Widgets/app_decoration.dart';

import '../../../Widgets/line_chart_2_line.dart';

class ProfileDiffScreen extends StatelessWidget {
  ProfileDiffScreen({super.key});

  final controller = Get.put(ProfileDiffControlelr());
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    List<Widget> listPages = [ChartProfileTab(), ListProjectProfileField()];
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Nguyen Minh Hung',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            _topField(constraints),
            _pageIconField(widthDevice),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemBuilder: (context, index) => listPages[index],
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _pageIconField(double widthDevice) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: Column(
        children: [
          Obx(
            () => Expanded(
              child: Row(
                children: [
                  ...controller.listPageIcon.map(
                    (e) => Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.checkTab.value = e['check'];
                          controller.switchPage(e['check']);
                        },
                        child: Column(
                          children: [
                            Center(
                              child: Icon(
                                e['icon'],
                                size: 25.0,
                                color: controller.checkTab.value == e['check']
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: AnimatedContainer(
                                color: AppColors.primaryColor,
                                duration: const Duration(milliseconds: 200),
                                height: 2.0,
                                width: controller.checkTab.value == e['check']
                                    ? widthDevice / 2
                                    : 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _topField(BoxConstraints constraints) {
    return SizedBox(
      width: double.infinity,
      height: constraints.maxHeight / 2.8,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _avtField(),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _taskField(),
                      const SizedBox(height: 10.0),
                      _basicDataProfileField()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                  child: CustomButton(
                    onPress: () {},
                    title: 'Follow',
                    height: 40.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: CustomButton(
                    onPress: () {},
                    title: 'Message',
                    height: 40.0,
                    backgroundColor: Colors.blue[200],
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _basicDataProfileField() => Expanded(
        flex: 2,
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Row(
                children: [
                  for (int i = 0; i < controller.listBasicData.length; i++)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.listBasicData[i]['data'].toString(),
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          AutoSizeText(
                            controller.listBasicData[i]['title'],
                            maxLines: 1,
                            minFontSize: 5.0,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              const Divider(thickness: 1),
              Column(
                children: [
                  RowBasicData(
                    title: 'hungnguyen.201102ak@gmail.com',
                  ),
                  RowBasicData(
                    title: DateFormat().add_yMEd().format(DateTime.now()),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Expanded _taskField() {
    return Expanded(
      flex: 1,
      child: LayoutBuilder(
        builder: (cContext, cConstraints) => Container(
          width: cConstraints.maxWidth,
          margin: const EdgeInsets.only(right: 10.0),
          decoration: AppDecoration.roundOfContainer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '44',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/app_icon.png',
                          fit: BoxFit.cover,
                          height: cConstraints.maxHeight / 4,
                          width: cConstraints.maxHeight / 4,
                        ),
                        const Text(
                          'Done',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 0.5,
                color: AppColors.textColor1,
                height: cConstraints.maxHeight / 1.5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '144',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/app_icon1.png',
                          fit: BoxFit.cover,
                          height: cConstraints.maxHeight / 4,
                          width: cConstraints.maxHeight / 4,
                        ),
                        const Text(
                          'To-do',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _avtField() {
    return Expanded(
      flex: 1,
      child: LayoutBuilder(
        builder: (cContext, cConstraints) => Column(
          children: [
            Container(
              width: cConstraints.maxWidth,
              height: cConstraints.maxWidth - 20.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/hoang.png'),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: cConstraints.maxWidth,
              // padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [Colors.blue[700]!, Colors.blue[400]!],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_icon4.png',
                    height: 30.0,
                    width: 30.0,
                  ),
                  const Text(
                    'BE Solf',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPress;
  Color? backgroundColor;
  Color? titleColor;
  double? height;
  CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.height,
    this.titleColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(2, 3),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(-2, -3),
            blurRadius: 2,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // ignore: deprecated_member_use
          primary: backgroundColor ?? AppColors.primaryColor,
          shadowColor: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: titleColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class ListProjectProfileField extends StatelessWidget {
  const ListProjectProfileField({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'All Projects',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '10 Projects',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        AllProjectDifItem(
            name: 'Windows Project',
            time: DateTime.now(),
            counting: 100,
            onPress: () {}),
        AllProjectDifItem(
            name: 'Android Project',
            time: DateTime.now(),
            counting: 10,
            onPress: () {}),
        AllProjectDifItem(
            name: 'AI Project',
            time: DateTime.now(),
            counting: 120,
            onPress: () {}),
        const SizedBox(height: 40.0),
      ],
    );
  }
}

class AllProjectDifItem extends StatelessWidget {
  final String name;
  final DateTime time;
  final int counting;
  final Function() onPress;
  const AllProjectDifItem({
    Key? key,
    required this.name,
    required this.time,
    required this.counting,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        // padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.mainColor,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10.0),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 15.0),
              child: Image.asset(
                'assets/images/app_icon1.png',
                height: 50.0,
                width: 50.0,
              ),
            ),
            Container(
              width: 0.5,
              height: 50.0,
              color: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 6.0,
                        width: 6.0,
                        margin: const EdgeInsets.only(right: 5.0),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        DateFormat().add_yMEd().format(time),
                        style: const TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onPress,
              child: Container(
                width: 50,
                height: 80.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        counting.toString(),
                        style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartProfileTab extends StatelessWidget {
  const ChartProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Commit Board',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: const Text(
                    'Select Week',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          color: AppColors.mainColor,
          child: const Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 6,
                top: 5.0,
                bottom: 5.0,
              ),
              child: LineChart2Line(isShowingMainData: true)),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: const [
              Text(
                'Task View',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.3,
              color: AppColors.mainColor,
              child: Row(
                children: [
                  _doneListField(true),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 1,
                    height: double.infinity,
                    color: AppColors.primaryColor,
                  ),
                  _doneListField(false),
                ],
              ),
            ),
            Positioned(
              top: -30,
              left: (MediaQuery.of(context).size.width - 60.0) / 8,
              child: Image.asset(
                'assets/images/app_icon.png',
                height: 60.0,
                width: 60.0,
              ),
            ),
            Positioned(
              top: -30,
              right: (MediaQuery.of(context).size.width - 60.0) / 8,
              child: Image.asset(
                'assets/images/app_icon1.png',
                height: 60.0,
                width: 60.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }

  Expanded _doneListField(bool check) {
    return Expanded(
      child: ListView(children: [
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: AppColors.textColor),
              children: [
                const TextSpan(
                  text: '100',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' tasks (${check ? 'done' : 'todo'})',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const Divider(thickness: 1),
        TaskDataRow(title: 'Windows Dev', time: DateTime.now(), check: check),
        TaskDataRow(title: 'Windows Dev', time: DateTime.now(), check: check),
        TaskDataRow(title: 'Windows Dev', time: DateTime.now(), check: check),
      ]),
    );
  }
}

class TaskDataRow extends StatelessWidget {
  final String title;
  final DateTime time;
  final bool check;
  const TaskDataRow({
    Key? key,
    required this.title,
    required this.time,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Image.asset(
            check
                ? 'assets/images/app_icon.png'
                : 'assets/images/app_icon1.png',
            height: 40.0,
            width: 40.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.0,
                      width: 6.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: check ? Colors.yellow : AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      DateFormat().add_yMEd().format(time),
                      style: const TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowBasicData extends StatelessWidget {
  final String title;
  int? maxLines;
  RowBasicData({
    Key? key,
    required this.title,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/app_icon.png',
          height: 30.0,
          width: 30.0,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: maxLines ?? 1,
            style: const TextStyle(color: AppColors.textColor, fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}

// class ProfileDiffScreen extends StatelessWidget {
//   ProfileDiffScreen({super.key});
//   DateRangePickerController dateController = DateRangePickerController();
//   RxInt select = 0.obs;

//   List<Map<String, dynamic>> fakeDataCommit = [
//     {
//       'time': DateTime.now().subtract(const Duration(days: 8)),
//       'commit': 2,
//     },
//     {
//       'time': DateTime.now().subtract(const Duration(days: 7)),
//       'commit': 2,
//     },
//     {
//       'time': DateTime.now(),
//       'commit': 2,
//     },
//     {
//       'time': DateTime.now().subtract(const Duration(days: 2)),
//       'commit': 2,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 20)),
//       'commit': 2,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 1)),
//       'commit': 15,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 2)),
//       'commit': 6,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 3)),
//       'commit': 7,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 4)),
//       'commit': 3,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 5)),
//       'commit': 4,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 6)),
//       'commit': 10,
//     },
//     {
//       'time': DateTime.now().add(const Duration(days: 88)),
//       'commit': 18,
//     }
//   ];
//   DateTime timeTemp = DateTime.now().subtract(const Duration(days: 10));
//   List<DateTime> listDateTime = [
//     for (int i = 0; i < 100; i++)
//       DateTime.now().subtract(const Duration(days: 10)).add(Duration(days: i))
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var heightDevice = MediaQuery.of(context).size.height;
//     var widthDevice = MediaQuery.of(context).size.width;
//     DateRangePickerController dateController = DateRangePickerController();

//     List<Widget> listPage = [
//       projectField(),
//       taskField(),
//     ];
//     return Scaffold(
//       backgroundColor: AppColors.greyBackground,
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       body: Over(
//         widthDevice: widthDevice,
//         heightDevice: heightDevice,
//         listView: Column(
//           children: [
//             _headerField(),
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: AppColors.textColor1.withOpacity(0.4),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Commit Calender',
//                         style: TextStyle(
//                           color: AppColors.textColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(10),
//                         onTap: () async {
//                           await _showDatePicker(context: context);
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 30,
//                           width: 70,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: AppColors.primaryColor.withOpacity(0.5),
//                           ),
//                           child: const Text(
//                             'Select',
//                             style: TextStyle(
//                               color: AppColors.textColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   GitHubCalenderBuit(fakeDataCommit: fakeDataCommit)
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Contribution activity',
//                   style: TextStyle(
//                     color: AppColors.textColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   contributionAcitvityField(DateTime.now()),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Obx(
//                 () => Align(
//                   alignment: Alignment.centerLeft,
//                   child: TabControl(
//                     check: select.value,
//                     control1: {
//                       'title': 'Project',
//                       'press': () {
//                         select.value = 0;
//                       },
//                     },
//                     control2: {
//                       'title': 'Task',
//                       'press': () {
//                         select.value = 1;
//                       },
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Obx(
//               () => Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: listPage[select.value],
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget projectField() {
//     return Column(
//       children: [
//         for (int i = 0; i < 3; i++)
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 5),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(width: 2, color: AppColors.textColor1),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const Icon(Icons.laptop_chromebook_outlined,
//                         color: AppColors.primaryColor),
//                     const Text(
//                       ' Gold Health',
//                       style: TextStyle(
//                           color: AppColors.textColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     ),
//                     const Spacer(),
//                     InkWell(
//                       onTap: () {},
//                       child: const Icon(Icons.more_horiz,
//                           color: AppColors.textColor),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 const Text(
//                   'No description provided',
//                   style: TextStyle(color: AppColors.textColor1, fontSize: 12),
//                 ),
//                 Row(
//                   children: const [
//                     Icon(Icons.star_border, color: AppColors.primaryColor1),
//                     Text(
//                       ' 2 people',
//                       style: TextStyle(
//                           color: AppColors.textColor,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//       ],
//     );
//   }

//   Widget taskField() {
//     return Column(
//       children: [
//         for (int i = 0; i < 3; i++)
//           TaskCard(
//             type: 2,
//             title: 'Meeting UI/UX',
//             date: DateTime.now(),
//           ),
//       ],
//     );
//   }

//   Widget contributionAcitvityField(DateTime time) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               '${DateFormat().add_MMM().format(time)} ${time.year} ',
//               style: const TextStyle(
//                   color: AppColors.textColor,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12),
//             ),
//             Expanded(
//               child: Container(height: 0.5, color: AppColors.textColor1),
//             ),
//           ],
//         ),
//         const SizedBox(height: 5),
//         Row(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   width: 2,
//                   height: 10,
//                   color: AppColors.textColor1.withOpacity(0.5),
//                 ),
//                 Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: AppColors.textColor1.withOpacity(0.2),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.publish,
//                     color: AppColors.textColor1.withOpacity(0.5),
//                     size: 12,
//                   ),
//                 ),
//                 Container(
//                   width: 2,
//                   height: 5,
//                   color: AppColors.textColor1.withOpacity(0.5),
//                 )
//               ],
//             ),
//             const SizedBox(width: 10),
//             const Text(
//               'Created 1 commit in 1 repository',
//               style: TextStyle(
//                 color: AppColors.textColor,
//                 fontSize: 14,
//               ),
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {},
//               child: const Icon(Icons.more_vert, color: AppColors.textColor),
//             ),
//           ],
//         ),
//         for (int i = 0; i < 2; i++)
//           SizedBox(
//             // color: Colors.red,
//             height: 50,
//             width: double.infinity,
//             // padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 2,
//                   height: 50,
//                   margin: const EdgeInsets.only(left: 9),
//                   color: AppColors.textColor1.withOpacity(0.5),
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 190,
//                           child: Text(
//                             'minhunsocute/GHealth',
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: AppColors.primaryColor1.withOpacity(1),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         // const Spacer(),
//                         SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: LinearPercentIndicator(
//                             lineHeight: 20,
//                             percent: 0.4,
//                             progressColor: AppColors.primaryColor,
//                             backgroundColor: Colors.grey.withOpacity(0.2),
//                             animation: true,
//                             animationDuration: 1000,
//                             barRadius: const Radius.circular(20),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 2),
//                     const Text(
//                       '155 commits',
//                       style: TextStyle(
//                         color: AppColors.textColor1,
//                         fontSize: 12,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }

//   SizedBox _headerField() {
//     return SizedBox(
//       height: 300,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               color: AppColors.primaryColor,
//             ),
//           ),
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   const SizedBox(width: 20),
//                   InkWell(
//                     onTap: () => Get.back(),
//                     child: Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: AppColors.textColor1.withOpacity(0.3),
//                       ),
//                       child: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: AppColors.textColor1.withOpacity(0.3),
//                       ),
//                       child: const Icon(
//                         Icons.more_vert,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                 ],
//               ),
//               const SizedBox(height: 80),
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 140,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: AppColors.mainColor,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.white.withOpacity(0.3),
//                           offset: const Offset(-2, 3),
//                           blurRadius: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 140,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     padding: const EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: AppColors.textColor1.withOpacity(0.4),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: const DecorationImage(
//                                   image: AssetImage('assets/images/hoang.png'),
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white.withOpacity(0.2),
//                                     offset: const Offset(-2, 3),
//                                     blurRadius: 2,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Truong Huynh Duc Hoang',
//                                     style: TextStyle(
//                                       color: AppColors.textColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   const Text(
//                                     'UI/UX Designer',
//                                     style: TextStyle(
//                                       color: AppColors.textColor1,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 8,
//                                         width: 8,
//                                         decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: AppColors.primaryColor,
//                                         ),
//                                       ),
//                                       const Text(
//                                         ' Age: 23',
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                           color: AppColors.textColor,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 8,
//                                         width: 8,
//                                         decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: AppColors.primaryColor,
//                                         ),
//                                       ),
//                                       const Text(
//                                         ' Skill: C#, C++, Dart,Java',
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                           color: AppColors.textColor,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(height: 3),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 8,
//                                         width: 8,
//                                         decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: AppColors.primaryColor,
//                                         ),
//                                       ),
//                                       const Text(
//                                         ' Description: Funny, Hard Core',
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                           color: AppColors.textColor,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {},
//                               child: const Icon(
//                                 Icons.more_horiz,
//                                 color: AppColors.textColor1,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   _showDatePicker({required BuildContext context}) async {
//     await showDialog(
//       useRootNavigator: false,
//       barrierColor: Colors.black54,
//       context: context,
//       builder: (context) => Dialog(
//         backgroundColor: Colors.transparent,
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           height: 400,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: AppColors.mainColor,
//             border: Border.all(width: 2, color: AppColors.textColor1),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 color: AppColors.mainColor,
//                 // elevation: 2,
//                 child: SfDateRangePicker(
//                   selectionTextStyle: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                   rangeTextStyle: const TextStyle(fontWeight: FontWeight.bold),
//                   headerStyle: const DateRangePickerHeaderStyle(
//                     backgroundColor: AppColors.primaryColor,
//                     textStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   monthCellStyle: const DateRangePickerMonthCellStyle(
//                     textStyle: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     todayTextStyle: TextStyle(
//                       color: AppColors.textColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     // weekendTextStyle: TextStyle(
//                     //   color: AppColors.textColor,
//                     //   fontWeight: FontWeight.bold,
//                     // ),
//                   ),
//                   selectionColor: AppColors.primaryColor,
//                   rangeSelectionColor: AppColors.primaryColor,
//                   todayHighlightColor: AppColors.primaryColor,
//                   startRangeSelectionColor: AppColors.primaryColor,
//                   endRangeSelectionColor: AppColors.primaryColor,
//                   // selectionRadius: 20,
//                   controller: dateController,
//                   view: DateRangePickerView.month,
//                   selectionMode: DateRangePickerSelectionMode.range,
//                   // onSelectionChanged: controller.selectionChanged,
//                   monthViewSettings: const DateRangePickerMonthViewSettings(
//                     enableSwipeSelection: false,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     color: AppColors.mainColor,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         // ignore: deprecated_member_use
//                         primary: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       onPressed: () {},
//                       child: Container(
//                         padding: const EdgeInsets.all(5),
//                         child: const Text(
//                           'Cancle',
//                           style: TextStyle(
//                             color: AppColors.textColor1,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     color: AppColors.mainColor,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         // ignore: deprecated_member_use
//                         primary: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       onPressed: () {},
//                       child: Container(
//                         padding: const EdgeInsets.all(5),
//                         child: const Text(
//                           'Done',
//                           style: TextStyle(
//                             color: AppColors.primaryColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

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
                    Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          color: AppColors.mainColor,
                        ),
                        child: listView)
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
