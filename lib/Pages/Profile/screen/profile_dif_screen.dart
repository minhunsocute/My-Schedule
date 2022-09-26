import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../Widgets/task_card.dart';
import '../../../Widgets/task_control.dart';

class ProfileDiffScreen extends StatelessWidget {
  ProfileDiffScreen({super.key});
  DateRangePickerController dateController = DateRangePickerController();
  RxInt select = 0.obs;

  List<Map<String, dynamic>> fakeDataCommit = [
    {
      'time': DateTime.now().subtract(const Duration(days: 8)),
      'commit': 2,
    },
    {
      'time': DateTime.now().subtract(const Duration(days: 7)),
      'commit': 2,
    },
    {
      'time': DateTime.now(),
      'commit': 2,
    },
    {
      'time': DateTime.now().subtract(const Duration(days: 2)),
      'commit': 2,
    },
    {
      'time': DateTime.now().add(const Duration(days: 20)),
      'commit': 2,
    },
    {
      'time': DateTime.now().add(const Duration(days: 1)),
      'commit': 15,
    },
    {
      'time': DateTime.now().add(const Duration(days: 2)),
      'commit': 6,
    },
    {
      'time': DateTime.now().add(const Duration(days: 3)),
      'commit': 7,
    },
    {
      'time': DateTime.now().add(const Duration(days: 4)),
      'commit': 3,
    },
    {
      'time': DateTime.now().add(const Duration(days: 5)),
      'commit': 4,
    },
    {
      'time': DateTime.now().add(const Duration(days: 6)),
      'commit': 10,
    },
    {
      'time': DateTime.now().add(const Duration(days: 88)),
      'commit': 18,
    }
  ];
  DateTime timeTemp = DateTime.now().subtract(const Duration(days: 10));
  List<DateTime> listDateTime = [
    for (int i = 0; i < 100; i++)
      DateTime.now().subtract(const Duration(days: 10)).add(Duration(days: i))
  ];
  int checkConstainInList(DateTime time) {
    for (var item in fakeDataCommit) {
      if (time.day == item['time'].day &&
          time.month == item['time'].month &&
          time.year == item['time'].year) {
        return item['commit'];
      }
    }
    return -1;
  }

  int get maxList => fakeDataCommit.fold<int>(
      0, (max, e) => e['commit'] > max ? e['commit'] : max);
  int getStart() {
    int count = 0;
    for (var item in listDateTime) {
      if (item.weekday != 1) {
        count++;
      } else {
        break;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    DateRangePickerController dateController = DateRangePickerController();

    List<Widget> listPage = [
      projectField(),
      taskField(),
    ];
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Over(
        widthDevice: widthDevice,
        heightDevice: heightDevice,
        listView: Column(
          children: [
            _headerField(),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.textColor1.withOpacity(0.4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Commit Calender',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          await _showDatePicker(context: context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                          child: const Text(
                            'Select',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  gitHubCommitField()
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contribution activity',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  contributionAcitvityField(DateTime.now()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => Align(
                  alignment: Alignment.centerLeft,
                  child: TabControl(
                    check: select.value,
                    control1: {
                      'title': 'Project',
                      'press': () {
                        select.value = 0;
                      },
                    },
                    control2: {
                      'title': 'Task',
                      'press': () {
                        select.value = 1;
                      },
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: listPage[select.value],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget projectField() {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColors.textColor1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.laptop_chromebook_outlined,
                        color: AppColors.primaryColor),
                    const Text(
                      ' Gold Health',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.more_horiz,
                          color: AppColors.textColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'No description provided',
                  style: TextStyle(color: AppColors.textColor1, fontSize: 12),
                ),
                Row(
                  children: const [
                    Icon(Icons.star_border, color: AppColors.primaryColor1),
                    Text(
                      ' 2 people',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
      ],
    );
  }

  Widget taskField() {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          TaskCard(
            type: 2,
            title: 'Meeting UI/UX',
            date: DateTime.now(),
          ),
      ],
    );
  }

  Widget contributionAcitvityField(DateTime time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${DateFormat().add_MMM().format(time)} ${time.year} ',
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            Expanded(
              child: Container(height: 0.5, color: AppColors.textColor1),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 2,
                  height: 10,
                  color: AppColors.textColor1.withOpacity(0.5),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.textColor1.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.publish,
                    color: AppColors.textColor1.withOpacity(0.5),
                    size: 12,
                  ),
                ),
                Container(
                  width: 2,
                  height: 5,
                  color: AppColors.textColor1.withOpacity(0.5),
                )
              ],
            ),
            const SizedBox(width: 10),
            const Text(
              'Created 1 commit in 1 repository',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.more_vert, color: AppColors.textColor),
            ),
          ],
        ),
        for (int i = 0; i < 2; i++)
          SizedBox(
            // color: Colors.red,
            height: 50,
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 2,
                  height: 50,
                  margin: const EdgeInsets.only(left: 9),
                  color: AppColors.textColor1.withOpacity(0.5),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 190,
                          child: Text(
                            'minhunsocute/GHealth',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.primaryColor1.withOpacity(1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // const Spacer(),
                        SizedBox(
                          width: 100,
                          height: 10,
                          child: LinearPercentIndicator(
                            lineHeight: 20,
                            percent: 0.4,
                            progressColor: AppColors.primaryColor,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            animation: true,
                            animationDuration: 1000,
                            barRadius: const Radius.circular(20),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '155 commits',
                      style: TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  SizedBox gitHubCommitField() {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 140,
            child: Column(
              children: [
                ...weekDays.map(
                  (e) => Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: middleGithubField(getStart(), maxList),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> middleGithubField(int middleData, int maxOfList) {
    int middle = ((listDateTime.length - middleData) / 7).floor();

    return [
      Column(
        children: [
          for (int i = 1; i <= 7; i++) startContainerGit(i, maxOfList),
        ],
      ),
      for (int i = 0; i < middle; i++)
        Column(
          children: [
            for (int j = 0; j < 7; j++)
              middleContainerGIt(middleData, i, j, maxOfList),
          ],
        ),
      Column(
        children: [
          for (int i = 0;
              i <
                  (listDateTime.length - middleData) -
                      ((listDateTime.length - middleData) / 7).floor() * 7;
              i++)
            endContainerGit(middle, i, middleData, maxOfList),
        ],
      )
    ];
  }

  Expanded startContainerGit(int i, int maxList) {
    int check = 0;
    if (i >= listDateTime[0].weekday) {
      check = checkConstainInList(listDateTime[i - listDateTime[0].weekday]);
    }
    return Expanded(
      child: Container(
        height: 15,
        width: 15,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: (i >= listDateTime[0].weekday)
              ? (check > 0)
                  ? AppColors.primaryColor.withOpacity(check / maxList)
                  : AppColors.textColor1.withOpacity(0.2)
              : Colors.transparent,
        ),
      ),
    );
  }

  Container endContainerGit(int middle, int i, int middleData, int maxOfList) {
    int check =
        (checkConstainInList(listDateTime[middle * 7 + i + middleData]));
    return Container(
      height: 16,
      width: 16,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: (check > 0)
            ? AppColors.primaryColor.withOpacity(check / maxOfList)
            : AppColors.textColor1.withOpacity(0.2),
      ),
    );
  }

  Expanded middleContainerGIt(int middleData, int i, int j, int maxOfList) {
    int check = checkConstainInList(listDateTime[middleData + 7 * i + j]);
    return Expanded(
      child: Container(
        height: 15,
        width: 15,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: (check > 0)
              ? AppColors.primaryColor.withOpacity(check / maxOfList)
              : AppColors.textColor1.withOpacity(0.2),
        ),
      ),
    );
  }

  SizedBox _headerField() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
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
                                  image: AssetImage('assets/images/hoang.png'),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    offset: const Offset(-2, 3),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  _showDatePicker({required BuildContext context}) async {
    await showDialog(
      useRootNavigator: false,
      barrierColor: Colors.black54,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.mainColor,
            border: Border.all(width: 2, color: AppColors.textColor1),
          ),
          child: Column(
            children: [
              Container(
                color: AppColors.mainColor,
                // elevation: 2,
                child: SfDateRangePicker(
                  selectionTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  rangeTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: AppColors.primaryColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  monthCellStyle: const DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    todayTextStyle: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    // weekendTextStyle: TextStyle(
                    //   color: AppColors.textColor,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  selectionColor: AppColors.primaryColor,
                  rangeSelectionColor: AppColors.primaryColor,
                  todayHighlightColor: AppColors.primaryColor,
                  startRangeSelectionColor: AppColors.primaryColor,
                  endRangeSelectionColor: AppColors.primaryColor,
                  // selectionRadius: 20,
                  controller: dateController,
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  // onSelectionChanged: controller.selectionChanged,
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                    enableSwipeSelection: false,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: AppColors.mainColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Cancle',
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.mainColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

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
