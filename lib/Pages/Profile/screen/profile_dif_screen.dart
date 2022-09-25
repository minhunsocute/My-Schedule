import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfileDiffScreen extends StatelessWidget {
  ProfileDiffScreen({super.key});
  DateRangePickerController dateController = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    DateRangePickerController dateController = DateRangePickerController();

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
                  SizedBox(
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
                            children: [
                              for (int i = 0; i < 20; i++)
                                Column(
                                  children: [
                                    for (int i = 0; i < 7; i++)
                                      Expanded(
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: AppColors.textColor1
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
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
          height: 430,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.mainColor,
          ),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: SfDateRangePicker(
                  selectionTextStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  rangeTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: AppColors.primaryColor1,
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
                  ),
                  selectionColor: AppColors.primaryColor1,
                  rangeSelectionColor: AppColors.primaryColor1,
                  todayHighlightColor: AppColors.primaryColor1,
                  controller: dateController,
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  // onSelectionChanged: controller.selectionChanged,
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                      enableSwipeSelection: false),
                ),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> weekDays = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
];

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
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: heightDevice),
                      child: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: AppColors.mainColor,
                          ),
                          child: listView),
                    )
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
